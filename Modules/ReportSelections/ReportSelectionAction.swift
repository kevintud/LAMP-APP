//
//  File.swift
//  LAMP APP
//
//  Created by Goin-Kevin on 4/27/24.
//

import Foundation
import UIKit

class ReportSelectionAction: Action {
    var data: ResponseModel?
    
    var title: String
    var leaderName: String
    weak var reportSelectionVC: ReportSelectionViewController?
    init(vc: ReportSelectionViewController? = nil, title: String, leaderName:String) {
        self.title = title
        self.leaderName = leaderName
    }
    

    
    func handleMenuItemSelection(menuItem: MenuItem, view: UIViewController){
        
        let actionType = menuItem.action
        let title = menuItem.title
        switch actionType {
        case is VisitorsPPAction.Type:
            let vc = VisitorsPPVC()
            let action = VisitorsPPAction(vc: vc, title: title, leaderName: leaderName)
            vc.visitorPPAction = action
            view.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.title = title
            
        case is ClusteringWRAction.Type:
            let vc = ClusteringWeeklyReportVC()
            let action = ClusteringWRAction(vc: vc, title: title)
            vc.clusteringAction = action
            view.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.title = title
            
        case is NCCReportAction.Type:
            let vc = NCCMonitoringReportVC()
            let action = NCCReportAction(vc: vc, title: title)
            vc.nccReportAction = action
            view.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.title = title
            
        case is BibleSharersAction.Type:
            let vc = BibleSharersReportVC()
            let action = BibleSharersAction(vc: vc, title: title)
            vc.bibleSharersAction = action
            view.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.title = title
        default:
            break
        }
    }
    
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

struct MenuItem {
    var title: String
    var action: Action.Type
}
