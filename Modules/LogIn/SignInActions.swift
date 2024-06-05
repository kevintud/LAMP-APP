//
//  SignInActions.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 3/30/24.
//

import UIKit

class SignInActions: SignInDelegate {

    weak var signInVC: SignInViewController?

    init(signInVC: SignInViewController) {
        self.signInVC = signInVC
    }

    func signIn(rememberMe: Bool) {
        guard let username = signInVC?.userNameTextField.text, !username.isEmpty,
              let password = signInVC?.passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter both username and password")
            return
        }

        if rememberMe {
            saveCredentials(username: username, password: password)
        } else {
            clearCredentials()
        }

        let url = URL(string: "http://www.lampchurch.net?module=authenticate")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody: [String: Any] = [
            "username": username,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            print("Failed to serialize request body: \(error)")
            return
        }

        print("API Request URL: \(url)")
        print("API Request Body: \(requestBody)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                self.showAlert(title: "Error", message: "Failed to sign in. Please try again.")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("API Response Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("No data received from server")
                self.showAlert(title: "Error", message: "Failed to sign in. Please try again.")
                return
            }

            do {
                let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                print("API Response JSON: \(responseModel)")
                self.handleResponse(responseModel)
            } catch {
                print("Failed to parse JSON response: \(error)")
                self.showAlert(title: "Error", message: "Failed to sign in. Please try again.")
            }
        }

        task.resume()
    }

    private func handleResponse(_ response: ResponseModel) {
        DispatchQueue.main.async {
            if response.message == "Success!" {
                let reportSelectionVC = ReportSelectionViewController()
                let reportAction = ReportSelectionAction(vc: reportSelectionVC, title: "Choose what to report", leaderName: response.user.username)
                reportSelectionVC.reportSelectionAction = reportAction
                self.signInVC?.navigationController?.pushViewController(reportSelectionVC, animated: true)
            } else {
                self.showAlert(title: "Error", message: "Invalid username or password.")
            }
        }
    }

    private func saveCredentials(username: String, password: String) {
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "username")
        defaults.set(password, forKey: "password")
    }

    private func clearCredentials() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "password")
    }

    private func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.signInVC?.present(alert, animated: true, completion: nil)
        }
    }
}






// ResponseModel

struct ResponseModel: Codable {
    let message: String
    let user: User
    let permissions: Permissions
}

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let isActive: String
    let roleId: String

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case isActive = "is_active"
        case roleId = "role_id"
    }
}

struct Permissions: Codable {
    let id: String
    let userId: String
    let canAddPerson: String
    let canUpdatePerson: String

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case canAddPerson = "can_add_person"
        case canUpdatePerson = "can_update_person"
    }
}

