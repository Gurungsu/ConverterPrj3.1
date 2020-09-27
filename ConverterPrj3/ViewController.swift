//
//  ViewController.swift
//  ConverterPrj3
//
//  Created by Suman on 9/25/20.
//  Copyright © 2020 Suman. All rights reserved.
//

import UIKit

class ViewController: ColorViewController, SettingsViewControllerDelegate {

    @IBOutlet weak var From_Value: UITextField!
    @IBOutlet weak var chage_to_value: UITextField!
    @IBOutlet weak var fromUnits: UILabel!
    @IBOutlet weak var toUnits: UILabel!
    @IBOutlet weak var level: UILabel!
    
    var ActiveMode : Converter = .Length
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        chage_to_value.delegate = self
        From_Value.delegate = self
    }
//======================================================================================
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//======================================================================================
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
//=======================================================================================
    @IBAction func convertValue(_ sender: UIButton) {
        var dataValue : UITextField?
                    var fildData = ""
        
        
        
        if let fromData = From_Value.text {
                    if fromData != "" {
                
                fildData = fromData
                dataValue = chage_to_value
            }
        }
        
        
        if let toData = chage_to_value.text {
            if toData != "" {
                fildData = toData
                dataValue = From_Value
            }
        }
        
        
        if dataValue != nil {
            switch(ActiveMode) {
            case .Length: var from_Unit, to_Unit : Length_Unit
                
                
                
                
                if dataValue == chage_to_value {
                    from_Unit = Length_Unit(rawValue: fromUnits.text!)!
                    to_Unit = Length_Unit(rawValue: toUnits.text!)!
                    
                    
                } else {
                    from_Unit = Length_Unit(rawValue: toUnits.text!)!
                    to_Unit = Length_Unit(rawValue: fromUnits.text!)!
                }
                
                
                
                if let dataFrom = Double(fildData) {
                    let convKey =  LengthConversionKey(toUnits: to_Unit, fromUnits: from_Unit)
                    let dataTo = dataFrom * lengthConversionTable[convKey]!;
                    
                    
                    dataValue?.text = "\(dataTo)"
                }
                
                
            case .Volume:
                
                
                var From_Unit, To_Unit : VolumeUnit
                if dataValue == chage_to_value {
                    From_Unit = VolumeUnit(rawValue: fromUnits.text!)!
                    
                    To_Unit = VolumeUnit(rawValue: toUnits.text!)!
                } else {
                    From_Unit = VolumeUnit(rawValue: toUnits.text!)!
                    To_Unit = VolumeUnit(rawValue: fromUnits.text!)!
                }
                
                
                
                
                if let fromVal = Double(fildData) {
                    let convKey =  VolumeConversionKey(toUnits: To_Unit, fromUnits: From_Unit)
                    let toVal = fromVal * volumeConversionTable[convKey]!;
                    dataValue?.text = "\(toVal)"
                }
            }
        }
        self.view.endEditing(true)
    }
 //==========================================================================================
    @IBAction func clearPressed(_ sender: UIButton) {
        self.From_Value.text = ""
        self.chage_to_value.text = ""
        self.view.endEditing(true)
    }
 //===========================================================================================
    @IBAction func ModeAction(_ sender: UIButton) {
        clearPressed(sender)
        switch (ActiveMode) {
        case .Length:
            
        
    ActiveMode = .Volume
            
    fromUnits.text = VolumeUnit.Gallons.rawValue
            
        toUnits.text = VolumeUnit.Liters.rawValue
            
        From_Value.placeholder = "Enter volume in \(fromUnits.text!)"
            
chage_to_value.placeholder = "Enter volume in \(toUnits.text!)"
            
            
        case .Volume:
    ActiveMode = .Length
    fromUnits.text = Length_Unit.Yards.rawValue
            toUnits.text = Length_Unit.Meters.rawValue
            From_Value.placeholder = "Enter length in \(fromUnits.text!)"
            
            chage_to_value.placeholder = "Enter length in \(toUnits.text!)"
        }
        level.text = "\(ActiveMode.rawValue) Conversion Calculator"
        
    }
  //===============================================================================================
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Go to Second Screen" {
            clearPressed(sender as! UIButton)
            if let  target = segue.destination.children[0] as? SettingsViewController {
                target.mode = ActiveMode
                target.delegate = self
            }
        }
    }
   //===============================================================================================
    func settingsChanged(fromUnits: Length_Unit, toUnits: Length_Unit)
    {
        self.fromUnits.text = fromUnits.rawValue
        self.toUnits.text = toUnits.rawValue
    }
    //==============================================================================================
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
            {
        self.fromUnits.text = fromUnits.rawValue
        self.toUnits.text = toUnits.rawValue
            }
        }
   
//====================================================================================================
    extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == chage_to_value) {
            From_Value.text = ""
        } else {
            chage_to_value.text = ""
        }
    }
}

