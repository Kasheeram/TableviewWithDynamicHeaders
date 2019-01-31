//
//  LeaveTypeViewController.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

protocol ConfirmPopupDelegate: class {
    func handleConfirmPopupAction(text:String, color:UIColor)
}

func showSignOutPopUp(message:String, presentVC:UIViewController){
    let popUpVC = LeaveTypeViewController()
    popUpVC.delegate = presentVC as? ConfirmPopupDelegate
    presentVC.addChildViewController(popUpVC)
    popUpVC.view.frame = presentVC.view.frame
    presentVC.view.addSubview(popUpVC.view)
    popUpVC.didMove(toParentViewController: presentVC)
}

class LeaveTypeViewController: UIViewController {

    weak var delegate: ConfirmPopupDelegate?
    var isYes = false
    
    let popUpview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let titalLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Leave Type"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textColor = Colors.headerRGB
        return label
    }()
    
    lazy var visitingParentButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 63/255, green: 182/255, blue: 220/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Visiting Parents", image: "visiting_parents_icon", color: color)
        button.tag = 103
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
        return button
    }()
    
    lazy var sicknessButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 182/255, green: 95/255, blue: 197/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Sick Leave", image: "sick_leave_icon", color: color)
        button.tag = 101
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
        
        return button
    }()
    
    
    lazy var emergencyButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 236/255, green: 105/255, blue: 96/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Emergency", image: "emergency_icon", color: color)
        button.tag = 105
        button.addTarget(self, action: #selector(LeaveTypeViewController.didSelectLeaveType), for: .touchUpInside)
        return button
    }()
    
    lazy var localGuardianButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 117/255, green: 64/255, blue: 238/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Local Guardian", image: "l_g_icon", color: color)
        button.tag = 104
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
        return button
    }()
    
    lazy var otherButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 236/255, green: 105/255, blue: 96/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Out pass", image: "other_leave_icon", color: color)
        button.tag = 106
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
        return button
    }()
    
    
    let nextButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //        button.addTarget(self, action: #selector(didSubmitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.showAnimate()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        view.isOpaque = false
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        nextButton.setDiagonalBackGroundGradient(colorOne: UIColor.init(red: 0.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0), colorTwo: UIColor.init(red: 2.0 / 255.0, green: 220.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0))
    }
    

    func setupView(){
        view.addSubview(popUpview)
        [titalLabel, visitingParentButton, sicknessButton, emergencyButton, localGuardianButton, otherButton].forEach{ popUpview.addSubview($0) }
        
        popUpview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        popUpview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        popUpview.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        titalLabel.topAnchor.constraint(equalTo: popUpview.topAnchor,constant:25).isActive = true
        titalLabel.leadingAnchor.constraint(equalTo: popUpview.leadingAnchor, constant: 30).isActive = true
        titalLabel.trailingAnchor.constraint(equalTo: popUpview.trailingAnchor, constant: -30).isActive = true
        titalLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        visitingParentButton.topAnchor.constraint(equalTo: titalLabel.bottomAnchor,constant:20).isActive = true
        visitingParentButton.leadingAnchor.constraint(equalTo: titalLabel.leadingAnchor).isActive = true
        visitingParentButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        visitingParentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
        sicknessButton.topAnchor.constraint(equalTo: visitingParentButton.bottomAnchor,constant:15).isActive = true
        sicknessButton.leadingAnchor.constraint(equalTo: visitingParentButton.leadingAnchor).isActive = true
        sicknessButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        sicknessButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emergencyButton.topAnchor.constraint(equalTo: sicknessButton.topAnchor).isActive = true
        emergencyButton.leadingAnchor.constraint(equalTo: sicknessButton.trailingAnchor,constant:10).isActive = true
        emergencyButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        emergencyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        localGuardianButton.topAnchor.constraint(equalTo: emergencyButton.bottomAnchor,constant:15).isActive = true
        localGuardianButton.leadingAnchor.constraint(equalTo: sicknessButton.leadingAnchor).isActive = true
        localGuardianButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        localGuardianButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        otherButton.topAnchor.constraint(equalTo: localGuardianButton.topAnchor).isActive = true
        otherButton.leadingAnchor.constraint(equalTo: localGuardianButton.trailingAnchor,constant:10).isActive = true
        otherButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        otherButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        nextButton.topAnchor.constraint(equalTo: otherButton.bottomAnchor, constant: 20).isActive = true
//        nextButton.leadingAnchor.constraint(equalTo: localGuardianButton.leadingAnchor, constant:30).isActive = true
//        nextButton.widthAnchor.constraint(equalToConstant: 158).isActive = true
//        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        

    }
    
   @objc func didSelectLeaveType(){
        self.delegate?.handleConfirmPopupAction(text:"Emergency  ", color:UIColor.red)
        removeAnimate()
    }
    
    func setPropertiesForLeaveButton(button:UIButton,title:String,image:String,color:UIColor){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("\(title)   ", for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named: image), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        let spacing = CGFloat(10.0)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: -spacing/2, bottom: 10, right: spacing)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = color.cgColor
        
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion:{(finished:Bool) in
            if finished{
                self.view.removeFromSuperview()
            }
        })
    }
    
}
