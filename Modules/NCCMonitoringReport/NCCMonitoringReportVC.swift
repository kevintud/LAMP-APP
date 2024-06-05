//
//  NCCMonitoringReportVC.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import UIKit

class NCCMonitoringReportVC: UIViewController {
    var nccReportAction: NCCReportAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
