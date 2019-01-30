//
//  Commons.swift
//  SpaceBasic
//
//  Created by kashee on 13/06/18.
//  Copyright © 2018 Smaat. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setDiagonalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setVerticalBackGroundGradient(colorOne:UIColor,colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

func setRighImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 15.0, height: size.height)
    }
    arrow.contentMode = UIViewContentMode.center
    textField.rightView = arrow
    textField.rightViewMode = UITextFieldViewMode.always
}

func setSmallRighImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 12.0, height: size.height-15)
    }
//    arrow.contentMode = UIViewContentMode.center
    arrow.contentMode = .scaleAspectFit
    textField.rightView = arrow
    textField.rightViewMode = UITextFieldViewMode.always
}

func setLeftImageToTextField(textField:UITextField, image:String? = "sb_add_leave_date_picker.png"){
    let arrow = UIImageView(image: UIImage(named: image!))
    if let size = arrow.image?.size {
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height-15)
    }
    arrow.contentMode = .scaleAspectFit
    textField.leftView = arrow
    textField.leftViewMode = UITextFieldViewMode.always
}

func setAddButtonProperties(button:UIButton, image:String, bgrColor:UIColor){
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("New", for: .normal)
    button.setImage(UIImage(named: image), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    button.backgroundColor = bgrColor
    button.layer.cornerRadius = 18
    button.contentVerticalAlignment = .fill
    button.contentHorizontalAlignment = .fill
    
    let spacing = CGFloat(17.0) // the amount of spacing to appear between image and title
    button.imageEdgeInsets = UIEdgeInsetsMake(9, 10, 9, spacing)
    button.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0)
    
}



public func isValidPassword(test:String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9])(?=.*[a-z]).{6,}")
    return passwordTest.evaluate(with: test)
}

public func onlyAlphabetAllowed(namveValue:String)->Bool{
    do {
        let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
        if regex.firstMatch(in: namveValue, options: [], range: NSMakeRange(0, namveValue.characters.count)) != nil {
            //self.showAlert(message: "Must not contain Number in Name")
            return true
        } else {
            return false
        }
    }
    catch {
        return false
    }
}

func getScreenWidth() -> CGFloat{
    return UIScreen.main.bounds.width
}

func getScreenHeight() -> CGFloat{
    return UIScreen.main.bounds.height
}

struct Colors {

    static let selectedBdrClr = UIColor.init(red: 233/255, green: 239/255, blue: 224.0/255, alpha: 1)
    static let selectedbgrClr = UIColor.init(red: 0.0/255, green: 183.0/255, blue: 224.0/255, alpha: 1)
    
    static let unSelectedBdrClr = UIColor.init(red: 198/255, green: 204/255, blue: 209/255, alpha: 1)
    static let unSelectedbgrClr = UIColor.init(red: 251/255, green: 252/255, blue: 253/255, alpha: 1)
    
    static let rewardRGB = UIColor(red: 242/255, green: 186/255, blue: 73/255, alpha: 1)
    
    static let helpMailRGB = UIColor(red: 55/255, green: 55/255, blue: 56/255, alpha: 1)
    
    static let headerRGB = UIColor(red: 33.0/255, green: 73.0/255, blue: 88.0/255, alpha: 1)
    
    static let titleRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.60)
    
    static let blackRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    
    static let buttonRGB1 = UIColor(red: 0.0/255, green: 180.0/255, blue: 226.0/255, alpha: 1)
    
    static let buttonRGB2 = UIColor(red: 2.0/255, green: 223.0/255, blue: 193/255, alpha: 1)
    
    static let pageControlRGB = UIColor(red: 0.0/255, green: 184.0/255, blue: 222.0/255, alpha: 1)
    static let pageControlpostRGB = UIColor(red: 48/255, green: 35/255, blue: 174/255, alpha: 1)
    
    static let brightGray = UIColor(red: 255.0/255.0, green: 69.0/255.0, blue: 0.0/255.0, alpha: 1)
    static let whiteTextRGB = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
    static let popUpSuccessRGB = UIColor(red: 42/255.0, green: 195/255.0, blue: 139/255.0, alpha: 1)
    static let lightGrayRGB = UIColor(red: 33.0/255.0, green: 73.0/255.0, blue: 88.0/255.0, alpha: 0.75)
    static let redRGB =  UIColor(red: 246/255, green: 77/255, blue: 67/255, alpha: 1)
    
    static let darkGrayRGB = UIColor(red: 50.0/255.0, green: 60.0/255.0, blue: 71.0/255.0, alpha: 1)
    
    static let announceRGB1 = UIColor(red: 112.0/255.0, green: 66.0/255.0, blue: 191.0/255.0, alpha: 0.80)
    static let announceRGB2 = UIColor(red: 48.0/255.0, green: 35.0/255.0, blue: 174/255.0, alpha: 0.80)
    
    static let pollRGB1 = UIColor(red: 23.0/255.0, green: 206.0/255.0, blue: 196.0/255.0, alpha: 1)
    static let pollRGB2 = UIColor(red: 8.0/255.0, green: 174.0/255.0, blue: 234.0/255.0, alpha: 1)
    
    static let leaveRGB1 = UIColor(red: 255.0/255.0, green: 131.0/255.0, blue: 8.0/255.0, alpha: 0.75)
    static let leaveRGB2 = UIColor(red: 253.0/255.0, green: 79.0/255.0, blue: 0/255.0, alpha: 0.75)
    
    static let complaintsRGB1 = UIColor(red: 237.0/255.0, green: 98.0/255.0, blue: 154.0/255.0, alpha: 0.95)
    static let complaintsRGB2 = UIColor(red: 200.0/255.0, green: 80.0/255.0, blue: 192/255.0, alpha: 0.95)
    
    static let unselectedColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.42)
    
    static let addComplaintButtonBgr = UIColor(red: 139/255.0, green: 38/255.0, blue: 129/255.0, alpha: 0.80)
    static let addLeaveButtonBgr = UIColor(red: 211/255.0, green: 86/255.0, blue: 27/255.0, alpha: 0.80)
    static let addAnnouncementButtonBgr = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.36)
    static let redColor = UIColor.init(red: 242/255, green: 36/255, blue: 46/255, alpha: 0.9)
    
}


func updateGreeting() -> String {
        
    let dateComponents = Calendar.current.dateComponents([.hour], from: Date())
    var greetingString = ""
    if let hour = dateComponents.hour {
        
        switch hour {
        case 0..<12:
            greetingString = "Good Morning..."
        case 12..<17:
            greetingString = "Good Afternoon..."
        default:
            greetingString = "Good Evening..."
        }
    
    }
    return greetingString
    
}


extension UILabel {
    /**
     This function adding image with text on label.
     */
    func addTextWithImage(text: String, image: UIImage, imageBehindText: Bool, keepPreviousText: Bool) {
        let lAttachment = NSTextAttachment()
        lAttachment.image = image
        
        // 1pt = 1.32px
        let lFontSize = round(self.font.pointSize * 1.32)
        let lRatio = image.size.width / image.size.height
        
        lAttachment.bounds = CGRect(x: 0, y: ((self.font.capHeight - lFontSize) / 2).rounded(), width: lRatio * lFontSize, height: lFontSize)
        
        let lAttachmentString = NSAttributedString(attachment: lAttachment)
        
        if imageBehindText {
            let lStrLabelText: NSMutableAttributedString
            
            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(string: text)
            }
            
            lStrLabelText.append(lAttachmentString)
            self.attributedText = lStrLabelText
        } else {
            let lStrLabelText: NSMutableAttributedString
            
            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(attributedString: lAttachmentString))
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(attributedString: lAttachmentString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            }
            
            self.attributedText = lStrLabelText
        }
    }
    
    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}


class calenderImageView:UIView {
    var image:String?
    let calenderImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "calender"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(imageName:String) {
        super.init(frame: CGRect.zero)
        image = imageName
        calenderImageView.image = UIImage(named: image!)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 176/255, green: 190/255, blue: 197/255, alpha: 1).cgColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        
        self.addSubview(calenderImageView)
        calenderImageView.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        calenderImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:8).isActive = true
        calenderImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-8).isActive = true
        calenderImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-8).isActive = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class lineLabel:UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 176/255, green: 190/255, blue: 197/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
//            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentAttributeKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}


