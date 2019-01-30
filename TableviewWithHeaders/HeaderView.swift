//
//  File.swift
//  TableviewWithHeaders
//
//  Created by kashee on 28/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: HeaderViewDelegate?
    var section: Int = 0
    
    var sickButtonHeight:NSLayoutConstraint?
    
    lazy var bgrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let arrowImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.sfDisplayBold(ofSize: 20)
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.addSubview(bgrView)
        bgrView.addSubview(headerView)
        headerView.addSubview(arrowImage)
        headerView.addSubview(titleLabel)
        bgrView.addSubview(sicknessButton)
        
        
        bgrView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgrView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgrView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgrView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        headerView.topAnchor.constraint(equalTo: bgrView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        arrowImage.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        arrowImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor,constant:6).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: arrowImage.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        sicknessButton.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant:10).isActive = true
        sicknessButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        sicknessButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        sickButtonHeight = NSLayoutConstraint(item: sicknessButton.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([sickButtonHeight!])
        sicknessButton.bottomAnchor.constraint(equalTo: bgrView.bottomAnchor,constant:-10).isActive = true
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
        
    }
    
    @objc private func didTapHeader() {
        delegate?.toggleSection(header: self, section: section)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
