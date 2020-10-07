//
//  ConversionCalcLabel.swift
//  ConverterPrj3
//
//  Created by jumper on 10/4/20.
//  Copyright © 2020 jumper. All rights reserved.
//


import UIKit

class ConversionCalcLabel: UILabel {
    override func awakeFromNib() {
        
        //Set the foreground color of the label to FOREGROUND_COLOR.
        
        self.textColor = FOREGROUND_COLOR
//        self.attributedText = [NSAttributedString.Key.foregroundColor.rawValue : UIColor.blue.cgColor]
    }
}
