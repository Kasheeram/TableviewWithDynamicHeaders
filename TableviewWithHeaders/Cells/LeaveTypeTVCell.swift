//
//  LeaveTypeTVCell.swift
//  TableviewWithHeaders
//
//  Created by kashee on 28/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class LeaveTypeTVCell: UITableViewCell {

//    var visitingParentHeight:NSLayoutConstraint?
//    var sickButtonHeight:NSLayoutConstraint?
//    var emergencyHeight:NSLayoutConstraint?
//    var localGuardianHeight:NSLayoutConstraint?
//    var otherHeight:NSLayoutConstraint?
//    var nextButtonHeight:NSLayoutConstraint?
    
    
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
//        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
         nextButton.setDiagonalBackGroundGradient(colorOne: UIColor.init(red: 0.0 / 255.0, green: 180.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0), colorTwo: UIColor.init(red: 2.0 / 255.0, green: 220.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0))
        super.layoutSubviews()
    }
    
    func setupView(){
        addSubview(visitingParentButton)
        addSubview(sicknessButton)
        addSubview(emergencyButton)
        addSubview(localGuardianButton)
        addSubview(otherButton)
        addSubview(nextButton)
        
        
        visitingParentButton.topAnchor.constraint(equalTo: topAnchor,constant:1).isActive = true
        visitingParentButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant:20).isActive = true
        visitingParentButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        visitingParentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        visitingParentHeight = NSLayoutConstraint(item: visitingParentButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        NSLayoutConstraint.activate([visitingParentHeight!])
        
        sicknessButton.topAnchor.constraint(equalTo: visitingParentButton.bottomAnchor,constant:15).isActive = true
        sicknessButton.leadingAnchor.constraint(equalTo: visitingParentButton.leadingAnchor).isActive = true
        sicknessButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        sicknessButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        sickButtonHeight = NSLayoutConstraint(item: sicknessButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        NSLayoutConstraint.activate([sickButtonHeight!])
        
        
        emergencyButton.topAnchor.constraint(equalTo: sicknessButton.topAnchor).isActive = true
        emergencyButton.leadingAnchor.constraint(equalTo: sicknessButton.trailingAnchor,constant:10).isActive = true
        emergencyButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        emergencyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        emergencyHeight = NSLayoutConstraint(item: emergencyButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//         NSLayoutConstraint.activate([emergencyHeight!])
        
        localGuardianButton.topAnchor.constraint(equalTo: emergencyButton.bottomAnchor,constant:15).isActive = true
        localGuardianButton.leadingAnchor.constraint(equalTo: sicknessButton.leadingAnchor).isActive = true
        localGuardianButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        localGuardianButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        localGuardianHeight = NSLayoutConstraint(item: localGuardianButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        NSLayoutConstraint.activate([localGuardianHeight!])
        
        otherButton.topAnchor.constraint(equalTo: localGuardianButton.topAnchor).isActive = true
        otherButton.leadingAnchor.constraint(equalTo: localGuardianButton.trailingAnchor,constant:10).isActive = true
        otherButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        otherButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        otherHeight = NSLayoutConstraint(item: otherButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        NSLayoutConstraint.activate([otherHeight!])
        
        nextButton.topAnchor.constraint(equalTo: otherButton.bottomAnchor, constant: 20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: localGuardianButton.leadingAnchor, constant:30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 158).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
//        nextButtonHeight = NSLayoutConstraint(item: nextButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        NSLayoutConstraint.activate([nextButtonHeight!])
//        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-20).isActive = true
        
    }
    
//    func updateConstraintss(){
//        emergencyHeight?.constant = 0
//        sickButtonHeight?.constant = 0
//        localGuardianHeight?.constant = 0
//        otherHeight?.constant = 0
//        nextButtonHeight?.constant = 0
//        visitingParentHeight?.constant = 44
//        visitingParentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-20).isActive = true
//        self.layoutIfNeeded()
//    }
    
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

}

//extension UIView {
//    func setBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
//        gradientLayer.locations = [0.0,1.0]
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func setDiagonalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
//        gradientLayer.locations = [0.0,1.0]
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
//
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//    func setVerticalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
//        gradientLayer.locations = [0.0,1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
//
//}

