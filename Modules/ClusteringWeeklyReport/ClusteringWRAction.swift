//
//  ClusteringWRAction.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import Foundation
import UIKit

class ClusteringWRAction: Action {
    var data: ResponseModel?
    
    weak var clusteringVC: ClusteringWeeklyReportVC?
    var title: String
    init(vc: ClusteringWeeklyReportVC, title: String) {
        self.clusteringVC = vc
        self.title = title
    }
}
