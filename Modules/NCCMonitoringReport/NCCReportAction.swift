//
//  NCCReportAction.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import Foundation

class NCCReportAction: Action {
    var data: ResponseModel?
    
    weak var nccReportVC: NCCMonitoringReportVC?
    var title: String
    
    init(vc: NCCMonitoringReportVC? = nil, title: String) {
        self.nccReportVC = vc
        self.title = title
    }
}
