//
//  ClusteringWeeklyReportVC.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import UIKit

class ClusteringWeeklyReportVC: UIViewController {
    var clusteringAction: ClusteringWRAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . systemBlue
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
