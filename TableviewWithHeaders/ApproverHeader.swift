//
//  ApproverHeader.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

protocol NoteHeaderViewDelegate: class {
    func noteToggleSection(header: ApproverHeader, section: Int)
}

class ApproverHeader: UITableViewHeaderFooterView {

    weak var delegate: NoteHeaderViewDelegate?
    var section: Int = 0
    
    var heightforReasonLabel:NSLayoutConstraint?
    
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
    
    lazy var numberLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5"
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
    
    lazy var reasonLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        addSubview(bgrView)
        bgrView.addSubview(numberLabel)
        bgrView.addSubview(titleLabel)
        bgrView.addSubview(reasonLabel)
        
        bgrView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgrView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgrView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgrView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        numberLabel.topAnchor.constraint(equalTo: bgrView.topAnchor, constant: 12).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: bgrView.leadingAnchor, constant: 10).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: bgrView.topAnchor,constant:8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor, constant: -5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        reasonLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        reasonLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        reasonLabel.trailingAnchor.constraint(equalTo: bgrView.trailingAnchor,constant:-10).isActive = true
        heightforReasonLabel = NSLayoutConstraint(item: reasonLabel.self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([heightforReasonLabel!])
        //        dateTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        reasonLabel.bottomAnchor.constraint(equalTo: bgrView.bottomAnchor, constant: -10).isActive = true
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }
    
    @objc private func didTapHeader() {
        delegate?.noteToggleSection(header: self, section: section)
    }
    


}
