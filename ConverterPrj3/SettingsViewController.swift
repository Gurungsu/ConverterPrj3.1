//
//  ViewController.swift
//  ConverterPrj3
//
//  Created by Suman on 9/25/20.
//  Copyright © 2020 Suman. All rights reserved.
//
import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChanged(fromUnits: Length_Unit, toUnits: Length_Unit)
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var fromUnits: UILabel!
    @IBOutlet weak var toUnits: UILabel!
    var pickerData: [String] = [String]()
    var isFrom = true
    var mode : Converter = .Length {
        didSet {
            switch(mode) {
            case .Length:
                var Values : [String] = []
                for val in Length_Unit.allCases {
                    Values.append(val.rawValue)
                }
                pickerData = Values
            case .Volume:
                var vals : [String] = []
                for val in VolumeUnit.allCases {
                    vals.append(val.rawValue)
                }
                pickerData = vals
            }
        }
    }
   
    
    var delegate : SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    
   
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        if let del = self.delegate {
            switch(mode) {
            case .Length:
                del.settingsChanged(fromUnits: Length_Unit(rawValue: fromUnits.text!)!, toUnits: Length_Unit(rawValue: toUnits.text!)!)
            case .Volume:
                del.settingsChanged(fromUnits: VolumeUnit(rawValue: fromUnits.text!)!, toUnits: VolumeUnit(rawValue: toUnits.text!)!)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    
    }
