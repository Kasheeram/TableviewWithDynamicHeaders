//
//  MainViewController.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ConfirmPopupDelegate {

    let headerId = "headerId"
    let cellId = "cellId"
    
    var twoDimensionalArray = [ExpandableNames]()
    var headerTitle = [String]()
    
    lazy var tableView:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
//        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets.zero
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        twoDimensionalArray.append(ExpandableNames(isExpanded: true, names: ["Select leave type"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: true, names: ["Select from and to date"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: true, names: ["Add Reason for out pass leave"]))
        headerTitle.append("Leave Types")
        headerTitle.append("Select the Dates")
        headerTitle.append("Reason for outpass")
        
        setupTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
//        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedSectionHeaderHeight = 80;
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        tableView.register(SecondHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, SecondHeaderViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SecondTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.titleLabel.text = twoDimensionalArray[indexPath.section].names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showSignOutPopUp(message: "", presentVC: self)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as? SecondHeader {
            
            headerView.titleLabel.text = headerTitle[section]
            headerView.section = section
            headerView.delegate = self
            
            let isExpanded = twoDimensionalArray[section].isExpanded
//            headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
            return headerView
        }
        return UIView()
        
    }
    
    func handleConfirmPopupAction(text: String, color: UIColor) {
       let indexpath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexpath) as! SecondTableViewCell
        cell.sicknessButton.setTitle(text, for: .normal)
        cell.titleLabelHeight?.constant = 0
        cell.sickButtonHeight?.constant = 44
        
    }
    
    
    func secondToggleSection(header: SecondHeader, section: Int) {
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        //        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
        
//        header.sickButtonHeight?.constant = 0
//        isSelected = false
        
        
        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.tableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.tableView.insertRows(at: indexPaths, with: .fade)
            }
            self.tableView.layoutIfNeeded()
        }

    }
    
    
        
    
}
