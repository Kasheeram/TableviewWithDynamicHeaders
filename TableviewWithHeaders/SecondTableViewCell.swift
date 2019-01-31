//
//  SecondTableViewCell.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    var sickButtonHeight:NSLayoutConstraint?
    var titleLabelHeight:NSLayoutConstraint?
    
    lazy var bgrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
//        view.addBorder(side: .top, color: UIColor.lightGray, width: 0.5)
//        view.addBorder(side: .bottom, color: UIColor.lightGray, width: 0.5)
        return view
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var sicknessButton:UIButton = {
        let button = UIButton()
        let color = UIColor.init(red: 182/255, green: 95/255, blue: 197/255, alpha: 1)
        self.setPropertiesForLeaveButton(button: button, title: "Sick Leave", image: "sick_leave_icon", color: color)
        button.tag = 101
        //        button.addTarget(self, action: #selector(AddLeaveViewController.didSelectLeaveType), for: .touchUpInside)
        
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
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
        addSubview(bgrView)
        bgrView.addSubview(titleLabel)
        bgrView.addSubview(sicknessButton)
        bgrView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgrView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgrView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgrView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: bgrView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor,constant:27).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: bgrView.bottomAnchor).isActive = true
        titleLabelHeight = NSLayoutConstraint(item: titleLabel.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 60)
        NSLayoutConstraint.activate([titleLabelHeight!])
        
        sicknessButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant:12).isActive = true
        sicknessButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        sicknessButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        sickButtonHeight = NSLayoutConstraint(item: sicknessButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([sickButtonHeight!])
//        sicknessButton.bottomAnchor.constraint(equalTo: bgrView.bottomAnchor,constant:-10).isActive = true
        
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
