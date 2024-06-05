//
//  HomeAction.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 3/30/24.
//

import Foundation
import UIKit

protocol Action {
    var title: String {get set}
    
}
class HomeAction {
    
    weak var homeVC: HomeViewController?
    var title: String?
    
    
    init(homeVC: HomeViewController? = nil, title: String) {
        self.homeVC = homeVC
        self.title = title
    }
    
    func menu() -> [MenuItem] {
        
        let menu:[MenuItem] = [MenuItem(title: "Visitor Progress Report", action: VisitorsPPAction.self),
                               MenuItem(title: "Clustering Weekly Report", action: ClusteringWRAction.self),
                               MenuItem(title: "NCC Monitoring Report", action: NCCReportAction.self),
                               MenuItem(title: "Bible Sharers Report", action: BibleSharersAction.self)
        ]
        
        return menu
    }
//    
//    func handleMenuItemSelection(menuItem: MenuItem){
//        
//        let actionType = menuItem.action
//        let title = menuItem.title
//        switch actionType {
//        case is VisitorsPPAction.Type:
//            let vc = VisitorsPPVC()
//            let action = VisitorsPPAction(vc: vc, title: title, leaderName: <#String#>)
//            vc.visitorPPAction = action
//            homeVC?.navigationController?.pushViewController(vc, animated: true)
//            vc.navigationItem.title = title
//            
//        case is ClusteringWRAction.Type:
//            let vc = ClusteringWeeklyReportVC()
//            let action = ClusteringWRAction(vc: vc, title: title)
//            vc.clusteringAction = action
//            homeVC?.navigationController?.pushViewController(vc, animated: true)
//            vc.navigationItem.title = title
//            
//        case is NCCReportAction.Type:
//            let vc = NCCMonitoringReportVC()
//            let action = NCCReportAction(vc: vc, title: title)
//            vc.nccReportAction = action
//            homeVC?.navigationController?.pushViewController(vc, animated: true)
//            vc.navigationItem.title = title
//            
//        case is BibleSharersAction.Type:
//            let vc = BibleSharersReportVC()
//            let action = BibleSharersAction(vc: vc, title: title)
//            vc.bibleSharersAction = action
//            homeVC?.navigationController?.pushViewController(vc, animated: true)
//            vc.navigationItem.title = title
//        default:
//            break
//        }
//        
//    }
    
    func signout() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            
            // Reset the state of your app here
            // For example, clear user defaults, cancel network requests, etc.
            
            let signInViewController = SignInViewController()
            let signInAction = SignInActions(signInVC: signInViewController)
            signInViewController.signInAction = signInAction
            
            let navigationController = UINavigationController(rootViewController: signInViewController)
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
}
//
//struct MenuItem {
//    var title: String
//    var action: Action.Type
//}
//

