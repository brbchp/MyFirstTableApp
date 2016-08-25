//
//  TableViewController.swift
//  MyFirstTableApp
//
//  Created by brb on 14.08.16.
//  Copyright © 2016 Andrey Tabachnikov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var carNames = ["Honda Civic", "Toyota Camry", "Landcruiser 150"]
    var carImages = ["honda-civic.jpg","toyota-camry.jpg","Land-Cruiser-Prado.jpg"]
    var carLocation = ["Cherepovets", "Vologda", "Yaroslavl"]
    var carPrice = [21000, 35000, 75000]
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    @IBAction func unwindBackToHomeScreen(segue: UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return carNames.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentefire = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentefire, forIndexPath: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.cellImage.image = UIImage(named: carImages[indexPath.row])
        cell.nameLabel.text = carNames[indexPath.row]
        cell.locationLabel.text = carLocation[indexPath.row]
        cell.priceLabel.text = String(carPrice[indexPath.row])
        
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.size.height / 2
        cell.cellImage.clipsToBounds = true
        return cell
    }
    
    //     // Override to support editing the table view.
    //     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //     if editingStyle == .Delete {
    //        self.carNames.removeAtIndex(indexPath.row)
    //        self.carImages.removeAtIndex(indexPath.row)
    //        self.carLocation.removeAtIndex(indexPath.row)
    //        self.carPrice.removeAtIndex(indexPath.row)
    //        // Delete the row from the data source
    //        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //     }
    //     }
    
    
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
            self.carNames.removeAtIndex(indexPath.row)
            self.carImages.removeAtIndex(indexPath.row)
            self.carLocation.removeAtIndex(indexPath.row)
            self.carPrice.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        allShareAction.backgroundColor = UIColor.blueColor()
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction, allShareAction]
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
            let destinationVC = segue.destinationViewController as! DetailViewController
                destinationVC.carImageDetail = self.carImages[indexPath.row]
                print (self.carImages[indexPath.row])
                
            }
        }
    }
    
    
}
