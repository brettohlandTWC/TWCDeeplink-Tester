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
        
        dataSource = Array<(String, String)>()
        dataSource.append(("Home",               "twcweather://"))
        dataSource.append(("Trenton,TN",         "twcweather://Location/38382:4:US"))
        dataSource.append(("Woodstock,GA",       "twcweather://Location/30189:4:US"))
        dataSource.append(("GPS",                "twcweather://Location/gps"))
        dataSource.append(("GPS Map",            "twcweather://Map/gps"))
        dataSource.append(("GPS Hourly",         "twcweather://Hourly/gps"))
        dataSource.append(("Trenton Hourly",     "twcweather://Hourly/38382:4:US"))
        dataSource.append(("Trenton Hourly Feed","twcweather://Hourly/38382:4:US?feed=true"))
        dataSource.append(("Trenton Daily",      "twcweather://TenDay/38382:4:US"))
        dataSource.append(("Trenton Map",        "twcweather://Map/38382:4:US"))
        dataSource.append(("NY NY Map",          "twcweather://Map/10001:4:US"))
        dataSource.append(("Purchase",           "twcweather://Purchase"))
        dataSource.append(("Settings",           "twcweather://Settings"))
        dataSource.append(("My Alerts",          "twcweather://MyAlerts"))
        
        tableViewMain.reloadData()
    }

    @IBOutlet weak var tableViewMain: UITableView!
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell") else {
            return UITableViewCell()
        }
        
        cell.prepareForReuse()
        
        let index = indexPath.row
        
        if dataSource.count > index {
            let action = dataSource[index].0
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
            let path = dataSource[index].1
            if let url = NSURL(string:path) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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













