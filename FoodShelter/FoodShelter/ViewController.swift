//
//  ViewController.swift
//  FoodShelter
//
//  Created by Mohamed Maazin Sudheer on 7/21/18.
//  Copyright © 2018 Mohamed Sudheer. All rights reserved.
//

import UIKit
import Alamofire

public var Lat = 43
public var Long = -88

public var rLat = Double()
public var rLong = Double()

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var searchCity: UITextField!
    @IBOutlet weak var milesText: UITextField!
    @IBOutlet weak var milesMenu: UIPickerView!
    
    var list = ["10","20","50","100"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.milesMenu.isHidden = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        rLat = Double(list[row])!
        rLong = Double(list[row])!
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.milesText.text = self.list[row]
        self.milesMenu.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.milesText {
            self.milesMenu.isHidden =  false
            
            textField.endEditing(true)
        }
    }
}

