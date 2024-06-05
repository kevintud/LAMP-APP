//
//  VisitorsPPAction.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import Foundation
import UIKit


class VisitorsPPAction: Action {
    var data: ResponseModel?
    
     
    weak var visitorPPVC: VisitorsPPVC?
    var title: String
    var leaderName: String?
    
    init(vc: VisitorsPPVC? = nil, title: String, leaderName:String) {
        self.visitorPPVC = vc
        self.title = title
        self.leaderName = leaderName
    }
    let activities = ["Bible Sharing", "Clustering", "Sunday Service"]
    
    func createCheckBoxAndLabels() {
        guard let stackView = visitorPPVC?.stackView else {
            return
        }
        for activity in activities {
            let button = UIButton(type: .system)
//            button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
//            button.setBackgroundImage(UIImage(systemName: "checkmark"), for: .selected)
            
            button.setTitle("◯", for: .normal) // Unicode character for circle
            button.setTitle("✔︎", for: .selected)
      
            button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
            
            let label = UILabel()
            label.text = activity
            label.numberOfLines = 0
            
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 5
            horizontalStackView.alignment = .fill
            horizontalStackView.distribution = .fill
            horizontalStackView.addArrangedSubview(button)
            horizontalStackView.addArrangedSubview(label)
            
            stackView.addArrangedSubview(horizontalStackView)
            
            NSLayoutConstraint.activate([
                horizontalStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
                horizontalStackView.heightAnchor.constraint(equalToConstant: 25),
                
                label.heightAnchor.constraint(equalToConstant: 25),
                button.heightAnchor.constraint(equalToConstant: 25)
            ])
        }
    }
    @objc func checkBoxTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    func submitTapped(){
        visitorPPVC?.navigationController?.popViewController(animated: true)
    }
    
    var clusterNames: [String] {
        return (1...10).map {"Cluster\($0)"}
    }
    
    let manager = ClusterManager()

}

///Mock Data for Table View:
struct SampleClusterGroups {
    let member: [SampleMembers]
    var clusterName: String
}
struct SampleMembers {
    let name: String
}

// Define a class to manage the cluster groups
class ClusterManager {
    // Create an array of names
    private let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank"]

    // Create an array of ClusterGroups
    var clusterGroups: [SampleClusterGroups] = []

    init() {
        // Populate the clusterGroups array
        for cluster in 1...5 {
            var members: [SampleMembers] = []
            for name in names {
                let member = SampleMembers(name: "\(name) \(cluster)")
                members.append(member)
            }
            let clusterGroup = SampleClusterGroups(member: members, clusterName: "Cluster \(cluster)")
            clusterGroups.append(clusterGroup)
        }
    }
}
