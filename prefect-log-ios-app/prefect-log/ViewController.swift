//
//  ViewController.swift
//  SRCMLog
//
//  Created by Kunju, Balu on 2/26/17.
//  Copyright © 2017 Kunju, Balu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Preceptor {
        let name: String
        let id: String
        let location: String
    }
    
    @IBOutlet weak var preceptorName: UITextField!
    @IBOutlet weak var preceptorPlace: UITextField!
    @IBOutlet weak var preceptorID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let x = UserDefaults.standard.object(forKey: "preceptorName") as? String {
            preceptorName.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "preceptorID") as? String {
            preceptorID.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "preceptorPlace") as? String {
            preceptorPlace.text = x
        }

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Continue(_ sender: Any) {
        print ("Continue Button Clicked")
        let preceptorDetails = preceptorName.text! + "/" + preceptorID.text! + "/" + preceptorPlace.text!
        print(preceptorDetails)
        performSegue(withIdentifier: "goToMainScreenVC", sender: preceptorDetails)
        
        UserDefaults.standard.set(preceptorName.text, forKey: "preceptorName")
        UserDefaults.standard.set(preceptorID.text, forKey: "preceptorID")
        UserDefaults.standard.set(preceptorPlace.text, forKey: "preceptorPlace")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToMainScreenVC") {
            /*
            if let destination = segue.description as? MainScreen {
                destination.preceptorDetailsFromLoginScreen = sender as? String
                print("Precetor Details Passed: \(sender)")
            }
            */
            let navVC = segue.destination as? UINavigationController
            let mainScreenVC = navVC?.viewControllers.first as! MainScreen
            mainScreenVC.preceptorDetailsFromLoginScreen = sender as? String
            print("Precetor Details Passed: \(sender)")
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        if let x = UserDefaults.standard.object(forKey: "preceptorName") as? String {
         preceptorName.text = x
        }

        if let x = UserDefaults.standard.object(forKey: "preceptorID") as? String {
            preceptorID.text = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "preceptorPlace") as? String {
            preceptorPlace.text = x
        }
         */
    }
    
        
    @IBAction func Exit(_ sender: Any) {
        exit(0)
    }
}

