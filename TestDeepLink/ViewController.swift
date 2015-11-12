//
//  ViewController.swift
//  TestDeepLink
//
//  Created by Halbrook, Curtis on 9/24/15.
//  Copyright © 2015 Halbrook, Curtis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataSource : Array<(String, String)>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = Array<(String, String)>()
        self.dataSource.append(("Home",               "twcweather://"))
        self.dataSource.append(("Trenton,TN",         "twcweather://Location/38382:4:US"))
        self.dataSource.append(("Woodstock,GA",       "twcweather://Location/30189:4:US"))
        self.dataSource.append(("GPS",                "twcweather://Location/gps"))
        self.dataSource.append(("GPS Map",            "twcweather://Map/gps"))
        self.dataSource.append(("GPS Hourly",         "twcweather://Hourly/gps"))
        self.dataSource.append(("Trenton Hourly",     "twcweather://Hourly/38382:4:US"))
        self.dataSource.append(("Trenton Hourly Feed","twcweather://Hourly/38382:4:US?feed=true"))
        self.dataSource.append(("Trenton Daily",      "twcweather://TenDay/38382:4:US"))
        self.dataSource.append(("Trenton Map",        "twcweather://Map/38382:4:US"))
        self.dataSource.append(("NY NY Map",          "twcweather://Map/10001:4:US"))
        self.dataSource.append(("Purchase",           "twcweather://Purchase"))
        
        self.tableViewMain.reloadData()
    }

    @IBOutlet weak var tableViewMain: UITableView!
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell") else {
            return UITableViewCell()
        }
        
        cell.prepareForReuse()
        
        let index = indexPath.row
        
        if self.dataSource.count > index {
            let action = self.dataSource[index].0
            if let label = cell.textLabel {
                label.text = action
            }
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let index = indexPath.row
        
        if self.dataSource.count > index {
            let path = self.dataSource[index].1
            if let url = NSURL(string:path) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    
    
    
    @IBAction func buttonCurrentTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"twcweather://")!)
    }
    
    @IBAction func buttonFirst(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"twcweather://Location/38382:4:US")!)
    }
    
    @IBAction func buttonSecondTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"twcweather://Location/30189:4:US")!)
    }
    
    @IBAction func buttonRadarTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"twcweather://Map/GPS")!)
    }
    
    @IBAction func buttonSelfieTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"twcweather://Hourly/30189:4:US")!)
    }
}













