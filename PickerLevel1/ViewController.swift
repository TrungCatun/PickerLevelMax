//
//  ViewController.swift
//  PickerLevel1
//
//  Created by Trung on 11/1/18.
//  Copyright © 2018 Trung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    
    let age = [Int](0...100)
    var clickTextFieldAge: Int?
    
    // set cho picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(age[row]) // in gia tri tren picker
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = String(age[row]) // connect picker view vs text field
    }
    
    // set text field and conect text field vs picker
    @objc func textFieldDidChange(_ textField: UITextField) {
        clickTextFieldAge = Int(ageTextField.text ?? "") ?? 0
        if clickTextFieldAge! > 100 {
            clickTextFieldAge = 100
            ageTextField.text = String(clickTextFieldAge!)
        }
        textField.text = String(clickTextFieldAge!)
        picker.selectRow(clickTextFieldAge!, inComponent: 0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hien thi mac dinh la 18
        picker.selectRow(18, inComponent: 0, animated: true)
        ageTextField.text = String(18)
        
        // su dung ham textFieldDidChange
        ageTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }


}

