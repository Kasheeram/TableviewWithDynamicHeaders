//
//  SecondHeader.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

protocol SecondHeaderViewDelegate: class {
    func secondToggleSection(header: SecondHeader, section: Int)
}

class SecondHeader: UITableViewHeaderFooterView {

    weak var delegate: SecondHeaderViewDelegate?
    var section: Int = 0
    
    lazy var bgrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.addBorder(side: .top, color: UIColor.lightGray, width: 0.5)
        //        view.addBorder(side: .bottom, color: UIColor.lightGray, width: 0.5)
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.02)
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
//        label.text = "1"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
//        label.backgroundColor = UIColor(red: 0/255, green: 180/255, blue: 226/255, alpha: 1.0)
        return label
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addSubview(bgrView)
        bgrView.addSubview(numberLabel)
        bgrView.addSubview(titleLabel)
        
        bgrView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgrView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgrView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgrView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        numberLabel.topAnchor.constraint(equalTo: bgrView.topAnchor, constant: 10).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor, constant: 10).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 16).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: bgrView.topAnchor,constant:8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 1).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor, constant: -5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
       
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
        
    }
    
    @objc private func didTapHeader() {
        delegate?.secondToggleSection(header: self, section: section)
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
