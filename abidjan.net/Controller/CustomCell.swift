//
//  CustomCell.swift
//  abidjan.net
//
//  Created by Pentest225 on 3/23/21.
//  Copyright © 2021 Pentest225. All rights reserved.
//

import Foundation
import  UIKit

class CustomCell: UITableViewCell {
    
    let message :String?
    var mainImage :UIImage?
    
    var messageTextVeiw : UITextView = {
        var textVeiw = UITextView()
        textVeiw.translatesAutoresizingMaskIntoConstraints = false
        return textVeiw
    }()
    
    var mainImageView : UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainImageView)
        self.addSubview(messageTextVeiw)
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("erro ini custom cell ")
    }
}
