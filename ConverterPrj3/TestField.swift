//
//  ConversionCalcLabel.swift
//  ConverterPrj3
//
//  Created by jumper on 10/4/20.
//  Copyright © 2020 jumper. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    override func awakeFromNib(){

        
        self.tintColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor  = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        
        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.green
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder else{
            return
        }
      
        self.attributedPlaceholder =
        NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: FOREGROUND_COLOR])

    }

}
