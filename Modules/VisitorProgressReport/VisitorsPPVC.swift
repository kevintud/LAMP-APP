//
//  VisitorsPPVC.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 4/1/24.
//

import UIKit

class VisitorsPPVC: UIViewController {
    
    var visitorPPAction: VisitorsPPAction?
    
    private lazy var remarksLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        
        let fullText = "Remarks*"
        let attributedString = NSMutableAttributedString(string: fullText)
        if let asteriskRange = fullText.range(of: "*") {
            let nsRange = NSRange(asteriskRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        }
        label.attributedText = attributedString
        
        return label
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "Hi,"
        //        let fullText = "Your name"
        //        let attributedString = NSMutableAttributedString(string: fullText)
        //        if let asteriskRange = fullText.range(of: "*") {
        //            let nsRange = NSRange(asteriskRange, in: fullText)
        //            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
        //            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        //        }
        //        label.attributedText = attributedString
        
        return label
    }()
    
    private lazy var attendanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Attendance"
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var clusterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        
        let fullText = "Cluster Name/Code*"
        let attributedString = NSMutableAttributedString(string: fullText)
        if let asteriskRange = fullText.range(of: "*") {
            let nsRange = NSRange(asteriskRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        }
        label.attributedText = attributedString
        
        return label
    }()
    private lazy var visitorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        
        let fullText = "Visitor Name*"
        let attributedString = NSMutableAttributedString(string: fullText)
        if let asteriskRange = fullText.range(of: "*") {
            let nsRange = NSRange(asteriskRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        }
        label.attributedText = attributedString
        
        return label
    }()
    lazy var stackView: CustomStackView = {
        let stackView = CustomStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var yourNameTextField: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = visitorPPAction?.leaderName
        return label
    }()
    
    private lazy var clusterText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "  Select option"
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.cornerRadius = 5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(clusterTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    private lazy var clusterMemberNameText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "  Select Cluster Member"
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.cornerRadius = 5
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(memberTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var remarksTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.text = "Guideline questions: How is the visitor coping up? How do they respond to activities? Are they ready to have a formal Bible Study or to be enrolled in an NC?"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        
        return textView
    }()
    
    //this view is added for spaces
    private lazy var spacerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var submitButton: CustomButton = {
        let button = CustomButton(backgroudColor: UIColor.systemBlue, title: "Submit")
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    ///Mark: Table for cluster option & member
    
    private lazy var clusterTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "custerCell")
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.layer.borderColor = UIColor.lightGray.cgColor
        table.layer.borderWidth = 1.0
        table.layer.cornerRadius = 5.0
        return table
    }()
    
    private lazy var clusterMemberTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "memberCell")
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.layer.borderColor = UIColor.lightGray.cgColor
        table.layer.borderWidth = 1.0
        table.layer.cornerRadius = 5.0
        return table
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var othersTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textAlignment = .left
        textField.placeholder = "Write the name of the visitor"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.isHidden = true // Initially hidden
        return textField
    }()
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside))
        tapGesture.cancelsTouchesInView = false
        return tapGesture
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    private lazy var remarksContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        clusterTableView.isHidden = true
        view.addGestureRecognizer(tapGestureRecognizer)
        setUpUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func submitButtonTapped(){
        visitorPPAction?.submitTapped()
    }
    @objc func clusterTapped () {
        clusterTableView.isHidden = !clusterTableView.isHidden
    }
    @objc func memberTapped () {
        clusterMemberTableView.isHidden = !clusterMemberTableView.isHidden
    }
    
    @objc func handleTapOutside(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if !clusterTableView.frame.contains(location) {
            clusterTableView.isHidden = true
        }
        if !clusterMemberTableView.frame.contains(location) {
            clusterMemberTableView.isHidden = true
        }
    }
    
    
    ///Mark: UISet up
    func setUpUI() {
        view.addSubview(scrollView)
        view.addSubview(clusterTableView)
        view.addSubview(clusterMemberTableView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(yourNameTextField)
        stackView.addArrangedSubview(clusterNameLabel)
        stackView.addArrangedSubview(clusterText)
        stackView.addArrangedSubview(visitorNameLabel)
        stackView.addArrangedSubview(clusterMemberNameText) // Initially add clusterMemberNameText
        stackView.addArrangedSubview(othersTextField) // Add othersTextField to stack view
        stackView.addArrangedSubview(attendanceLabel)
        visitorPPAction?.createCheckBoxAndLabels()
        stackView.addArrangedSubview(remarksContainerStackView) // Add the container stack view
        stackView.addArrangedSubview(remarksTextView)
        stackView.addArrangedSubview(spacerView)
        stackView.addArrangedSubview(submitButton)

        // Add remarksLabel and datePicker to the container stack view
        remarksContainerStackView.addArrangedSubview(remarksLabel)
        remarksContainerStackView.addArrangedSubview(datePicker)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Constraints for scrollView
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Constraints for contentView
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Constraints for stackView
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

            nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            clusterNameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            clusterNameLabel.heightAnchor.constraint(equalToConstant: 40),
            visitorNameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            visitorNameLabel.heightAnchor.constraint(equalToConstant: 40),
            yourNameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            yourNameTextField.heightAnchor.constraint(equalToConstant: 40),
            clusterText.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            clusterText.heightAnchor.constraint(equalToConstant: 40),
            clusterMemberNameText.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            clusterMemberNameText.heightAnchor.constraint(equalToConstant: 40),
            othersTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            othersTextField.heightAnchor.constraint(equalToConstant: 40),
            attendanceLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            attendanceLabel.heightAnchor.constraint(equalToConstant: 100),
            remarksContainerStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor), // Updated constraint
            remarksContainerStackView.heightAnchor.constraint(equalToConstant: 40), // Adjust as needed
            remarksTextView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            spacerView.heightAnchor.constraint(equalToConstant: 150),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            
            remarksTextView.heightAnchor.constraint(equalToConstant: 150), // Adjust height as needed

            // Constraints for clusterTableView
            clusterTableView.topAnchor.constraint(equalTo: clusterNameLabel.bottomAnchor, constant: 8), // Adjust constant as needed
            clusterTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Adjust constant as needed
            clusterTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // Adjust constant as needed
            clusterTableView.heightAnchor.constraint(equalToConstant: 200), // Adjust as needed

            // Constraints for clusterMemberTableView
            clusterMemberTableView.topAnchor.constraint(equalTo: clusterMemberNameText.bottomAnchor, constant: 8), // Adjust constant as needed
            clusterMemberTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Adjust constant as needed
            clusterMemberTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // Adjust constant as needed
            clusterMemberTableView.heightAnchor.constraint(equalToConstant: 200), // Adjust as needed
        ])
    }


    
}
extension VisitorsPPVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
    }
}

extension VisitorsPPVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == clusterTableView {
            return (visitorPPAction?.manager.clusterGroups.count ?? 0) + 1
        } else if tableView == clusterMemberTableView {
            let selectedCluster = clusterTableView.indexPathForSelectedRow?.row ?? 0
            if selectedCluster >= visitorPPAction?.manager.clusterGroups.count ?? 0 {
                return 0
            }
            return visitorPPAction?.manager.clusterGroups[selectedCluster].member.count ?? 0
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == clusterTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "custerCell", for: indexPath)
            if indexPath.row < visitorPPAction?.manager.clusterGroups.count ?? 0 {
                let clusterGroup = visitorPPAction?.manager.clusterGroups[indexPath.row]
                cell.textLabel?.text = clusterGroup?.clusterName
            } else {
                cell.textLabel?.text = "Others"
            }
            return cell
        } else if tableView == clusterMemberTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
            let selectedClusterIndex = clusterTableView.indexPathForSelectedRow?.row ?? 0
            if selectedClusterIndex < visitorPPAction?.manager.clusterGroups.count ?? 0 {
                let member = visitorPPAction?.manager.clusterGroups[selectedClusterIndex].member[indexPath.row]
                cell.textLabel?.text = member?.name
            }
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == clusterTableView {
            if indexPath.row < visitorPPAction?.manager.clusterGroups.count ?? 0 {
                let clusterGroup = visitorPPAction?.manager.clusterGroups[indexPath.row]
                clusterText.text = clusterGroup?.clusterName
                othersTextField.isHidden = true
                clusterMemberNameText.isHidden = false
            } else {
                clusterText.text = "Others"
                othersTextField.isHidden = false
                clusterMemberNameText.isHidden = true
            }
            clusterMemberNameText.text = "Select Cluster Member"
            clusterTableView.isHidden = true
            clusterMemberTableView.reloadData()
        } else if tableView == clusterMemberTableView {
            let selectedClusterIndex = clusterTableView.indexPathForSelectedRow?.row ?? 0
            if selectedClusterIndex < visitorPPAction?.manager.clusterGroups.count ?? 0 {
                let selectedMember = visitorPPAction?.manager.clusterGroups[selectedClusterIndex].member[indexPath.row]
                clusterMemberNameText.text = selectedMember?.name
            }
            clusterMemberTableView.isHidden = true
        }
    }
}




