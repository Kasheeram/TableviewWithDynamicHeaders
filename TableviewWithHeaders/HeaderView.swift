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
//        view.addBorder(side: .top, color: UIColor.lightGray, width: 0.5)
//        view.addBorder(side: .bottom, color: UIColor.lightGray, width: 0.5)
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
    
    lazy var numberLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.font = UIFont.systemFont(ofSize: 11)
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 0/255, green: 180/255, blue: 226/255, alpha: 1.0)
        return label
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
//        bgrView.addSubview(headerView)
        bgrView.addSubview(numberLabel)
        bgrView.addSubview(titleLabel)
        bgrView.addSubview(sicknessButton)
        
        
        bgrView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgrView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgrView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgrView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
//        headerView.topAnchor.constraint(equalTo: bgrView.topAnchor).isActive = true
//        headerView.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor).isActive = true
//        headerView.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor).isActive = true
//        headerView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        numberLabel.topAnchor.constraint(equalTo: bgrView.topAnchor, constant: 12).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor, constant: 10).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: bgrView.topAnchor,constant:8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor, constant: -5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        sicknessButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant:10).isActive = true
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

public enum BorderSide {
    case top, bottom, left, right
}

extension UIView {
    public func addBorder(side: BorderSide, color: UIColor, width: CGFloat) {
        let border = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = color
        self.addSubview(border)
        
        let topConstraint = topAnchor.constraint(equalTo: border.topAnchor)
        let rightConstraint = trailingAnchor.constraint(equalTo: border.trailingAnchor)
        let bottomConstraint = bottomAnchor.constraint(equalTo: border.bottomAnchor)
        let leftConstraint = leadingAnchor.constraint(equalTo: border.leadingAnchor)
        let heightConstraint = border.heightAnchor.constraint(equalToConstant: width)
        let widthConstraint = border.widthAnchor.constraint(equalToConstant: width)
        
        
        switch side {
        case .top:
            NSLayoutConstraint.activate([leftConstraint, topConstraint, rightConstraint, heightConstraint])
        case .right:
            NSLayoutConstraint.activate([topConstraint, rightConstraint, bottomConstraint, widthConstraint])
        case .bottom:
            NSLayoutConstraint.activate([rightConstraint, bottomConstraint, leftConstraint, heightConstraint])
        case .left:
            NSLayoutConstraint.activate([bottomConstraint, leftConstraint, topConstraint, widthConstraint])
        }
    }
}
