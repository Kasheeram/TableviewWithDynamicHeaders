//
//  ReasonTVCell.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class ReasonTVCell: UITableViewCell {

    lazy var descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        return textView
    }()
    
    let nextButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.init(red: 0.0/255, green: 183.0/255, blue: 224.0/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.init(red: 0.0/255, green: 183.0/255, blue: 224.0/255, alpha: 1.0).cgColor
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
        addSubview(descriptionTextView)
        addSubview(nextButton)
        
        descriptionTextView.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor,constant:-10).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: descriptionTextView.leadingAnchor, constant:30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 158).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
