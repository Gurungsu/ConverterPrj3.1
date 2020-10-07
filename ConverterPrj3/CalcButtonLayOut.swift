//
//  ConversionCalcButton.swift
//  ConverterPrj3
//
//  Created by jumper on 10/4/20.
//  Copyright © 2020 jumper. All rights reserved.
//

import UIKit

class ConversionCalcButton: UIButton {

    override func awakeFromNib() {
        
        //Set the background color of the button to FOREGROUND_COLOR.
        self.backgroundColor = FOREGROUND_COLOR
        self.tintColor = BACKGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        
     
    }

}
