//
//  SelectedLeaveTypeTVCell.swift
//  TableviewWithHeaders
//
//  Created by kashee on 28/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class SelectedLeaveTypeTVCell: UITableViewCell {

    lazy var localGuardianButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 117/255, green: 64/255, blue: 238/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Local Guardian", image: "l_g_icon", color: color)
        button.tag = 104
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
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
    
    func setupView(){
        
        addSubview(localGuardianButton)
        
        localGuardianButton.topAnchor.constraint(equalTo: topAnchor,constant:10).isActive = true
        localGuardianButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant:10).isActive = true
        localGuardianButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        localGuardianButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        localGuardianButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-20).isActive = true
        
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

}
