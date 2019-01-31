//
//  ViewController.swift
//  TableviewWithHeaders
//
//  Created by kashee on 28/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

struct ExpandableNames {
    
    var isExpanded: Bool
    let names: [String]
    
}

class ViewController: UIViewController {
    
    var headerTitle = [String]()
    var twoDimensionalArray = [ExpandableNames]()
    var isSelected:Bool = false
    var isOutpass:Bool = true
    
    var header = "header"
    var dateHeaderId = "dateHeaderId"
    var reasonHeardeId = "reasonHeardeId"
    var contactHeardeId = "contactHeardeId"
    var noteHeardeId = "noteHeardeId"
    
    var leaveTypeCell = "leaveTypeCellId"
    var dateCell = "dateCellId"
    var regularLeaveCellID = "regularLeaveCellID"
    var resonCellId = "resonCellId"
    var contactDtlCellId = "contactDtlCellId"
    var approverNoteCellId = "approverNoteCellId"
    
    
    lazy var leaveTableView:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tv.separatorStyle = .none
        tv.contentInset = UIEdgeInsets.zero
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        
        twoDimensionalArray.append(ExpandableNames(isExpanded: true, names: ["Select leave type"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: false, names: ["Select from and to date"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: false, names: ["Reason for out pass"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: false, names: ["Contact Details"]))
        twoDimensionalArray.append(ExpandableNames(isExpanded: false, names: ["Note to Approver"]))
        headerTitle.append("Leave Types")
        headerTitle.append("Select the Dates")
        headerTitle.append("Reason for outpass")
        headerTitle.append("Contact Details")
        headerTitle.append("Note to Approver")
//        leaveTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        view.addSubview(leaveTableView)
        
        leaveTableView.delegate = self
        leaveTableView.dataSource = self
        self.leaveTableView.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.leaveTableView.estimatedSectionHeaderHeight = 73;
        
//        self.leaveTableView.rowHeight = UITableViewAutomaticDimension
//        self.leaveTableView.estimatedRowHeight = 40
        
//        leaveTableView.tintColor = UIColor.red
        
        leaveTableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: header)
        leaveTableView.register(DatesHeader.self, forHeaderFooterViewReuseIdentifier: dateHeaderId)
        leaveTableView.register(ReasonHeader.self, forHeaderFooterViewReuseIdentifier: reasonHeardeId)
        leaveTableView.register(ContactHeader.self, forHeaderFooterViewReuseIdentifier: contactHeardeId)
        leaveTableView.register(ApproverHeader.self, forHeaderFooterViewReuseIdentifier: noteHeardeId)
        
        leaveTableView.register(LeaveTypeTVCell.self, forCellReuseIdentifier: leaveTypeCell)
        leaveTableView.register(LeaveDatesTVCell.self, forCellReuseIdentifier: dateCell)
        leaveTableView.register(RegularLeaveTVCell.self, forCellReuseIdentifier: regularLeaveCellID)
        leaveTableView.register(ReasonTVCell.self, forCellReuseIdentifier: resonCellId)
        leaveTableView.register(ContactDetailsTVCell.self, forCellReuseIdentifier: contactDtlCellId)
        leaveTableView.register(ApproverNoteTVCell.self, forCellReuseIdentifier: approverNoteCellId)
        
        leaveTableView.topAnchor.constraint(equalTo: view.topAnchor, constant:50).isActive = true
        leaveTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leaveTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        leaveTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate, DatesHeaderViewDelegate, ReasonHeaderViewDelegate, ContactHeaderViewDelegate, NoteHeaderViewDelegate {
    
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
        let actionType = twoDimensionalArray[indexPath.section]
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: leaveTypeCell, for: indexPath) as! LeaveTypeTVCell
            cell.nextButton.tag = indexPath.section
            cell.nextButton.addTarget(self, action: #selector(actionOnSelectedCell), for: .touchUpInside)
        //            cell.textLabel?.text = twoDimensionalArray[indexPath.section].names[indexPath.row]
            return cell
        case 1:
            if isOutpass{
                let cell = tableView.dequeueReusableCell(withIdentifier: dateCell, for: indexPath) as! LeaveDatesTVCell
                cell.nextButton.tag = indexPath.section
                cell.nextButton.addTarget(self, action: #selector(actionOnSelectedCell), for: .touchUpInside)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: regularLeaveCellID, for: indexPath) as! RegularLeaveTVCell
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: resonCellId, for: indexPath) as! ReasonTVCell
            cell.nextButton.tag = indexPath.section
            cell.nextButton.addTarget(self, action: #selector(actionOnSelectedCell), for: .touchUpInside)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactDtlCellId, for: indexPath) as! ContactDetailsTVCell
            
//            cell.nextButton.tag = indexPath.section
//            cell.nextButton.addTarget(self, action: #selector(actionOnSelectedCell), for: .touchUpInside)
            cell.backgroundColor = .red
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: approverNoteCellId, for: indexPath) as! ApproverNoteTVCell
//            cell.nextButton.tag = indexPath.section
//            cell.nextButton.addTarget(self, action: #selector(actionOnSelectedCell), for: .touchUpInside)
            cell.backgroundColor = .purple
            return cell
        default:
//            print("select valid option")
            let cell = tableView.dequeueReusableCell(withIdentifier: approverNoteCellId, for: indexPath) as! ApproverNoteTVCell
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        case 1:
            return 300
        case 2:
            return 150
        case 3:
            return 150
        case 4:
            return 150
        default:
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: header) as? HeaderView {
                
                headerView.titleLabel.text = headerTitle[section]
                headerView.section = section
                headerView.delegate = self
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
                return headerView
            }
            return UIView()
        case 1:
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: dateHeaderId) as? DatesHeader {
                
                headerView.titleLabel.text = headerTitle[section]
                headerView.section = section
                headerView.delegate = self
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
                return headerView
            }
            return UIView()
        case 2:
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reasonHeardeId) as? ReasonHeader {
                
                headerView.titleLabel.text = headerTitle[section]
                headerView.section = section
                headerView.delegate = self
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
                return headerView
            }
            return UIView()
        case 3:
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: contactHeardeId) as? ContactHeader {
                
                headerView.titleLabel.text = headerTitle[section]
                headerView.section = section
                headerView.delegate = self
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
                return headerView
            }
            return UIView()
        case 4:
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: noteHeardeId) as? ApproverHeader {
                
                headerView.titleLabel.text = headerTitle[section]
                headerView.section = section
                headerView.delegate = self
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                headerView.arrowImage.image = UIImage(named:isExpanded ? "arrowDown" : "arrowRIght")
                return headerView
            }
            return UIView()
        default:
            return UIView()
        }
        
        
        
    }
    
    
    func toggleSection(header: HeaderView, section: Int) {
        // we'll try to close the section first by deleting the rows
        
//        let mainVC = MainViewController()
//        navigationController?.pushViewController(mainVC, animated: true)
        
        
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }

        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded

//        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")

        header.sickButtonHeight?.constant = 0
        isSelected = false


        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
        
        
//        UIView.performWithoutAnimation {
//            if isExpanded {
//                leaveTableView.deleteRows(at: indexPaths, with: .fade)
//            } else {
//                leaveTableView.insertRows(at: indexPaths, with: .fade)
//            }
//            leaveTableView.layoutIfNeeded()
//        }
    
    }
    
    func DatetoggleSection(header: DatesHeader, section: Int) {
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        //        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
        
        header.heightForDatesTextView?.constant = 0
        isSelected = false
        
        
        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
        
    }
    
    func reasonToggleSection(header: ReasonHeader, section: Int) {
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
//        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
        
        header.heightforReasonLabel?.constant = 0
        isSelected = false
        
        
        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
    }
    
    func contactToggleSection(header: ContactHeader, section: Int) {
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        //        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
        
        header.heightforReasonTxtView?.constant = 0
        isSelected = false
        
        
        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
    }
    
    func noteToggleSection(header: ApproverHeader, section: Int) {
        // we'll try to close the section first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        //        header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
        
        header.heightforReasonLabel?.constant = 0
        isSelected = false
        
        
        UIView.animate(withDuration: 0.5) {
            if isExpanded {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
    }
    
    
    
    @objc func actionOnSelectedCell(sender: UIButton){
        let section = sender.tag
        var isExpanded:Bool?
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        switch section {
        case 0:
            let index = IndexPath(row: 0, section: section)
            let cell = leaveTableView.cellForRow(at: index) as! LeaveTypeTVCell
            let header = leaveTableView.headerView(forSection: section) as! HeaderView
            header.sicknessButton.setTitle("kashee  ", for: .normal)
//            isOutpass = false
            isExpanded = twoDimensionalArray[section].isExpanded
            twoDimensionalArray[section].isExpanded = !isExpanded!
            //header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
            header.sickButtonHeight?.constant = 40
            isSelected = true
        case 1:
            let index = IndexPath(row: 0, section: section)
            let cell = leaveTableView.cellForRow(at: index) as! LeaveDatesTVCell
            let header = leaveTableView.headerView(forSection: section) as! DatesHeader
            
            isExpanded = twoDimensionalArray[section].isExpanded
            twoDimensionalArray[section].isExpanded = !isExpanded!
            //header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
            header.dateTextView.text = "\(cell.outTimeTextField.text!)\n\n\(cell.inTimeTextField.text!)"
            header.heightForDatesTextView?.constant = 60
            isSelected = true
        case 2:
            let index = IndexPath(row: 0, section: section)
            let cell = leaveTableView.cellForRow(at: index) as! ReasonTVCell
            let header = leaveTableView.headerView(forSection: section) as! ReasonHeader
            
            isExpanded = twoDimensionalArray[section].isExpanded
            twoDimensionalArray[section].isExpanded = !isExpanded!
            //header.arrowImage.image = UIImage(named:isExpanded ? "arrowRIght" : "arrowDown")
            header.reasonLabel.text = "\(cell.descriptionTextView.text!)"
            header.heightforReasonLabel?.constant = 60
            isSelected = true
        default:
            print("do some thing")
        }
        

        UIView.animate(withDuration: 0.5) {
            if isExpanded! {
                self.leaveTableView.deleteRows(at: indexPaths, with: .fade)
            } else {
                self.leaveTableView.insertRows(at: indexPaths, with: .fade)
            }
            self.leaveTableView.layoutIfNeeded()
        }
        
        if !isOutpass{
            if section == 0{
                let index = IndexPath(row: 0, section: 1)
                leaveTableView.reloadRows(at: [index], with: UITableViewRowAnimation.fade)
            }
        }
        
    }
    
}

