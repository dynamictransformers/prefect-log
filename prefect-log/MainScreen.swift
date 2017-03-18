//
//  MainScreen.swift
//  SRCMLog
//
//  Created by Kunju, Balu on 2/28/17.
//  Copyright © 2017 Kunju, Balu. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var preceptorDetailsLbl: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var preceptorDetailsFromLoginScreen: String!
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preceptorDetailsLbl.text = preceptorDetailsFromLoginScreen
        // Do any additional setup after loading the view.
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        
    }

    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing) {
            leadingConstraint.constant = -150

            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
    
    @IBAction func exitApp(_ sender: Any) {
        exit(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
