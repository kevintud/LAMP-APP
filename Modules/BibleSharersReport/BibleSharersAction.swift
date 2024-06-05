//
//  BibleSharersAction.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import Foundation

class BibleSharersAction: Action {
    var data: ResponseModel?
    
    
    weak var bibleSharersVC: BibleSharersReportVC?
    var title: String
    init(vc: BibleSharersReportVC? = nil, title: String) {
        self.bibleSharersVC = vc
        self.title = title
    }
}
