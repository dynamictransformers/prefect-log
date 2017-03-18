//
//  LogIndSitting.swift
//  SRCMLog
//
//  Created by Kunju, Balu on 3/5/17.
//  Copyright © 2017 Kunju, Balu. All rights reserved.
//

import UIKit

class LogIndSitting: UIViewController {
    
    @IBOutlet weak var indSittingPreceptorDetails: UILabel!
    @IBOutlet weak var datePickerTxt: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var duration: UISlider!
    @IBOutlet weak var durationTxt: UITextField!
    let step: Float = 1

    @IBOutlet weak var indSittingSelectedAbhyasi: UITextView!
    
    @IBAction func durationChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        durationTxt.text = "\(Int(roundedValue))"
    }
    
    func createDatePicker() {
        
        //format for date picker
        datePicker.datePickerMode = .dateAndTime
        
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button Item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        datePickerTxt.inputAccessoryView = toolbar
        
        //assigning datePicker to text field
        datePickerTxt.inputView = datePicker
    }
    
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        datePickerTxt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        indSittingSelectedAbhyasi.text = ""
        var selectedAbhyasis = ""
        for value in selectedAbhyasisList.sorted()
        {
            selectedAbhyasis += value + "\n"
        }
        indSittingSelectedAbhyasi.text = selectedAbhyasis
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var preceptorDetails = ""
        if let x = UserDefaults.standard.object(forKey: "preceptorName") as? String {
            preceptorDetails = x + "/"
        }
        if let x = UserDefaults.standard.object(forKey: "preceptorID") as? String {
            preceptorDetails += x + "/"
        }
        
        if let x = UserDefaults.standard.object(forKey: "preceptorPlace") as? String {
            preceptorDetails += x
        }
        
        indSittingPreceptorDetails.text = preceptorDetails

        createDatePicker()
        
    }

    
}
