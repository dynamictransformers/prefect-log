//
//  ListAbhyasis.swift
//  SRCMLog
//
//  Created by Kunju, Balu on 3/7/17.
//  Copyright © 2017 Kunju, Balu. All rights reserved.
//

import UIKit


var allAbhyasisList = [String]()
var selectedAbhyasisList = [String]()

class ListAbhyasis: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var abhyasiListView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (allAbhyasisList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = allAbhyasisList[indexPath.row]
        if (selectedAbhyasisList.contains((cell.textLabel?.text)!))
        {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            allAbhyasisList.remove(at: indexPath.row)
            abhyasiListView.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let viewController = storyboard?.instantiateViewController(withIdentifier: "AddOrEditAbhyasiVC")
        self.navigationController?.pushViewController(viewController!, animated: true)
        */
        
        // Toggle checkmark on each abhyasi on clicking
        if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            selectedAbhyasisList = selectedAbhyasisList.filter{$0 != allAbhyasisList[indexPath.row]}
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            selectedAbhyasisList = selectedAbhyasisList.filter{$0 != allAbhyasisList[indexPath.row]}
            selectedAbhyasisList.append(allAbhyasisList[indexPath.row])
        }
        
        print(selectedAbhyasisList)
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        abhyasiListView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        abhyasiListView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
