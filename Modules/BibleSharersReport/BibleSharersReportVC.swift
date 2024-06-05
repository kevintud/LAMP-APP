//
//  BibleSharersReportVC.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import UIKit

class BibleSharersReportVC: UIViewController {
    var bibleSharersAction: BibleSharersAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
