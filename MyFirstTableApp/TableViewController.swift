//
//  TableViewController.swift
//  MyFirstTableApp
//
//  Created by brb on 14.08.16.
//  Copyright © 2016 Andrey Tabachnikov. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    

    var carList: [Cars] = []
//    var carList: [Cars] = [
//        Cars(name: "Honda Civic", address: "Cherepovets", price: 21000, image: "honda-civic.jpg"),
//        Cars(name: "Toyota Camry", address: "Vologda", price: 35000, image: "toyota-camry.jpg"),
//        Cars(name: "Landcruiser 150", address: "Yaroslavl", price: 75000, image: "Land-Cruiser-Prado.jpg")
//    ]
    
    
    
    //    override func prefersStatusBarHidden() -> Bool {
    //        return true
    //    }
    @IBAction func unwindBackToHomeScreen(segue: UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentefire = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentefire, forIndexPath: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.cellImage.image = UIImage(data: carList[indexPath.row].image)
        cell.nameLabel.text = carList[indexPath.row].name
        cell.locationLabel.text = carList[indexPath.row].address
        cell.priceLabel.text = String(carList[indexPath.row].price)
        
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.size.height / 2
        cell.cellImage.clipsToBounds = true
        return cell
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let allShareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Поделиться"){
            (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            
            let allShareActionMenu = UIAlertController(title: nil, message: "Поделиться через", preferredStyle: .ActionSheet)
            
            let emailShareAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let facebookShareAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let vkShareAction = UIAlertAction(title: "VK", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Отмена", style: .Default, handler: nil)
            
            allShareActionMenu.addAction(emailShareAction)
            allShareActionMenu.addAction(facebookShareAction)
            allShareActionMenu.addAction(vkShareAction)
            allShareActionMenu.addAction(cancelAction)
            
            self.presentViewController(allShareActionMenu, animated: true, completion: nil)
        }
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Удалить"){
            (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            self.carList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        allShareAction.backgroundColor = UIColor.blueColor()
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction, allShareAction]
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destinationViewController as! DetailViewController
                
//                destinationVC.carImageDetail = self.carList[indexPath.row].image
                
                destinationVC.carImageDetail = self.carList[indexPath.row].image

                
            }
        }
    }
    
    
}
