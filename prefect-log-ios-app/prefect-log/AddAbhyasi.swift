//
//  AddAbhyasi.swift
//  SRCMLog
//
//  Created by Kunju, Balu on 3/7/17.
//  Copyright © 2017 Kunju, Balu. All rights reserved.
//

import UIKit

class AddAbhyasi: UIViewController {
    
    @IBOutlet weak var addAbhyasiName: UITextField!
    @IBOutlet weak var addAbhyasiID: UITextField!
    @IBOutlet weak var addAbhyasiPlace: UITextField!
    
    @IBOutlet weak var addAbhyasiComment: UILabel!

    @IBAction func addNewAbhyasi(_ sender: Any)
    {
        if (addAbhyasiName.text != "" )
        {
            let abhyasiDetails = addAbhyasiName.text! + "/" + addAbhyasiID.text! + "/" + addAbhyasiPlace.text!
            allAbhyasisList.append(abhyasiDetails)
            addAbhyasiName.text = ""
            addAbhyasiID.text = ""
            addAbhyasiPlace.text = ""
            
            addAbhyasiComment.text = "New abhyasis - " + abhyasiDetails + " added."
        }
    }
}
