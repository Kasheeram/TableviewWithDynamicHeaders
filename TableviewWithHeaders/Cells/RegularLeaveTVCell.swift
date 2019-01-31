//
//  RegularLeaveTVCell.swift
//  TableviewWithHeaders
//
//  Created by kashee on 31/01/19.
//  Copyright © 2019 kashee. All rights reserved.
//

import UIKit

class RegularLeaveTVCell: UITableViewCell {

    lazy var outTimeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Out Time"
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor =  UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    lazy var inTimeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "In Time"
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor =  UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
        return label
    }()
    
    lazy var outTimeTextField:UITextField = {
        let textField = UITextField()
        self.setPropertiesForTF(tf: textField,placeHolder: "10.00 AM")
        return textField
    }()
    
    lazy var inTimeTextField:UITextField = {
        let textField = UITextField()
        self.setPropertiesForTF(tf: textField,placeHolder: "07.00 PM")
        return textField
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
    
    func  setupView(){
        
        addSubview(outTimeLabel)
        addSubview(inTimeLabel)
        addSubview(outTimeTextField)
        addSubview(inTimeTextField)
        addSubview(nextButton)
        
        outTimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        outTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:48).isActive = true
        outTimeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.40).isActive = true
        outTimeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        inTimeLabel.topAnchor.constraint(equalTo: outTimeLabel.topAnchor).isActive = true
        inTimeLabel.leadingAnchor.constraint(equalTo: outTimeLabel.trailingAnchor, constant:10).isActive = true
        inTimeLabel.widthAnchor.constraint(equalTo: outTimeLabel.widthAnchor).isActive = true
        inTimeLabel.heightAnchor.constraint(equalTo: outTimeLabel.heightAnchor).isActive = true

        outTimeTextField.topAnchor.constraint(equalTo: outTimeLabel.bottomAnchor, constant: 5).isActive = true
        outTimeTextField.leadingAnchor.constraint(equalTo: outTimeLabel.leadingAnchor).isActive = true
        outTimeTextField.widthAnchor.constraint(equalTo: outTimeLabel.widthAnchor).isActive = true
        outTimeTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
//
        inTimeTextField.topAnchor.constraint(equalTo: outTimeTextField.topAnchor).isActive = true
        inTimeTextField.leadingAnchor.constraint(equalTo: inTimeLabel.leadingAnchor).isActive = true
        inTimeTextField.widthAnchor.constraint(equalTo: outTimeTextField.widthAnchor).isActive = true
        inTimeTextField.heightAnchor.constraint(equalTo: outTimeTextField.heightAnchor).isActive = true

        nextButton.topAnchor.constraint(equalTo: inTimeTextField.bottomAnchor, constant: 20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: outTimeTextField.leadingAnchor, constant: 20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 158).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
    }
    
    func setPropertiesForTF(tf : UITextField, placeHolder : String) {
        tf.translatesAutoresizingMaskIntoConstraints = false
        //        tf.delegate = self
        tf.placeholder = placeHolder
        tf.textColor = UIColor.init(red: 50.0/255, green: 60.0/255, blue: 71.0/255, alpha: 1)
        tf.backgroundColor = UIColor(red: 251/255, green: 252/255, blue: 253/255, alpha: 1)
        tf.font = UIFont.boldSystemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        
    }
    

}
