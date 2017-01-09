//
//  CustomRoundedButton.swift
//  LyricsGenerator
//
//  Created by shashank kannam on 1/8/17.
//  Copyright © 2017 shashank kannam. All rights reserved.
//

import UIKit

@IBDesignable
class CustomRoundedButton: UIButton {

    @IBInspectable var cornerRadius:CGFloat = 40.0{
        didSet{
        layer.cornerRadius = 40.0
    }
    }
    
    override func prepareForInterfaceBuilder() {
        layer.cornerRadius = 40.0
    }

}
