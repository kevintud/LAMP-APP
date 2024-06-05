//
//  HomeViewController.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 3/30/24.
//

import UIKit


class HomeViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {
    
    var isMenuVisible = false
    var selectedIndexPath : IndexPath?
    var homeAction: HomeAction?
    
    lazy var signoutBtn: CustomButton = {
        let button = CustomButton(backgroudColor: .white, title: "Sign Out")
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return button
    }()
    
    
    //for hamburger menu

//    lazy var menuButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("☰", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(menuButtontapped), for: .touchUpInside)
//        return button
//    }()
//    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.separatorStyle = .none
//        tableView.showsVerticalScrollIndicator = false
//        
//        return tableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        tableView.isHidden = true
        setupUI()
    
    }
    
    
    ///MARK: TableView Data Source & Delegate
    
    // for hamburger menu
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = homeAction?.menu()[indexPath.row].title
//        cell.textLabel?.textColor = .black
//        cell.selectionStyle = .none
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        guard let menu = homeAction?.menu().count else {
//            return 0
//        }
//        return menu
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        guard let menuItem = homeAction?.menu()[indexPath.row] else {
//            return
//        }
//        homeAction?.handleMenuItemSelection(menuItem: menuItem)
//        // Reset color for the previously selected cell
//        if let selectedIndexPath = selectedIndexPath {
//            if let previousSelectedCell = tableView.cellForRow(at: selectedIndexPath) {
//                previousSelectedCell.textLabel?.textColor = .black
//            }
//        }
//        
//        // Set color for the newly selected cell
//        if let cell = tableView.cellForRow(at: indexPath) {
//            cell.textLabel?.textColor = .blue
//        }
//        
//        selectedIndexPath = indexPath
//        tableView.isHidden = true
//    }
    
    ///MARK:  Private function
    func setupUI() {
//        view.addSubview(menuButton)
//        view.addSubview(tableView)
        view.addSubview(signoutBtn)
//        menuButton.translatesAutoresizingMaskIntoConstraints = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        signoutBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //for hamburger menu
//            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            menuButton.widthAnchor.constraint(equalToConstant: 40),
//            menuButton.heightAnchor.constraint(equalToConstant: 40),
//            
//            tableView.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: menuButton.topAnchor),
//            tableView.widthAnchor.constraint(equalToConstant: 250),
//            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            signoutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signoutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            signoutBtn.widthAnchor.constraint(equalToConstant: 80)
            
        ])
    }
  //for humburger menu
//    @objc func menuButtontapped() {
//        isMenuVisible.toggle()
//        tableView.isHidden = !isMenuVisible
//    }
    
    @objc func signOut() {
        homeAction?.signout()
    }
    
}
