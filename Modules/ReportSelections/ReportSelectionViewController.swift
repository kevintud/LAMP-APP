//
//  ReportSelectionViewController.swift
//  LAMP APP
//
//  Created by Goin-Kevin on 4/27/24.
//

import UIKit

class ReportSelectionViewController: UIViewController {
    
    lazy var signoutBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .white, title: "Sign Out")
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return button
    }()
    
    var reportSelectionAction: ReportSelectionAction?
    
    lazy var stackView: CustomStackView = {
        let stackView = CustomStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var clusteringReportBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .systemBlue, title: "Clustering Report")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(clusteringReportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var nccReportBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .systemBlue, title: "NCC Report")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(nccReportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var bibleSharersReportBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .systemBlue, title: "Bible Sharers Report")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(bibleSharesReportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var visitorsReportBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .systemBlue, title: "Visitors Report")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(visitorsReportButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setUpUI()
    }
    
    @objc func visitorsReportButtonTapped() {
        let visitors = MenuItem(title: "Visitors Progress Report", action: VisitorsPPAction.self)
        reportSelectionAction?.handleMenuItemSelection(menuItem: visitors, view: self)
    }
    
    @objc func clusteringReportButtonTapped() {
        let menuItem = MenuItem(title: "Clustering Weekly Report", action: ClusteringWRAction.self)
        reportSelectionAction?.handleMenuItemSelection(menuItem: menuItem, view: self)
    }
    
    @objc func nccReportButtonTapped() {
        let menuItem = MenuItem(title: "NCC Report", action: ClusteringWRAction.self)
        reportSelectionAction?.handleMenuItemSelection(menuItem: menuItem, view: self)
    }
    
    @objc func bibleSharesReportButtonTapped() {
        let menuItem = MenuItem(title: "Bible Sharers Report", action: ClusteringWRAction.self)
        reportSelectionAction?.handleMenuItemSelection(menuItem: menuItem, view: self)
    }
    
    @objc func signOut() {
        reportSelectionAction?.signout()
    }
    
    func setUpUI() {
        view.addSubview(stackView)
        view.addSubview(signoutBtn)
        
        stackView.addArrangedSubview(visitorsReportBtn)
        stackView.addArrangedSubview(bibleSharersReportBtn)
        stackView.addArrangedSubview(nccReportBtn)
        stackView.addArrangedSubview(clusteringReportBtn)
        
        NSLayoutConstraint.activate([
            signoutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            signoutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signoutBtn.widthAnchor.constraint(equalToConstant: 80),
            signoutBtn.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.topAnchor.constraint(equalTo: signoutBtn.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            visitorsReportBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            visitorsReportBtn.heightAnchor.constraint(equalToConstant: 50),
            
            bibleSharersReportBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            bibleSharersReportBtn.heightAnchor.constraint(equalToConstant: 50),
            
            nccReportBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            nccReportBtn.heightAnchor.constraint(equalToConstant: 50),
            
            clusteringReportBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            clusteringReportBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

