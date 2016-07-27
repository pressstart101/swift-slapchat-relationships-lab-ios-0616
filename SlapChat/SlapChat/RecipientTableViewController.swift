//
//  RecipientTableViewController.swift
//  SlapChat
//
//  Created by Flatiron School on 7/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientTableViewController: UITableViewController {
    var managedMessageObjects: [Recipient] = []
    let store: DataStore = DataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.store.fetchDataByEntity()
        
//        tableView.reloadData()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    
//    override func viewWillAppear(animated: Bool) {
//        
//        super.viewWillAppear(true)
//        
//        store.fetchDataByEntity()
//        tableView.reloadData()
//       // print("fetch array \(store.fetchArray)")
//
//        
//    }
    
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
        return store.recipients.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

         let eachRecepient = store.recipients[indexPath.row]
        
          cell.textLabel?.text = eachRecepient.name
        
        // Configure the cell...

        return cell
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var newArray = store.recipients
        
        let destination = segue.destinationViewController as! TableViewController
        
        let path = tableView.indexPathForSelectedRow
        
//        print(newArray)
        
        let oneRecipient = store.recipients[path!.row]
        
//      print(oneRecipient)
//
//        let messages = //
//            print(messages?.first?.content)
//
        if let unwrappedMessages = oneRecipient.messages{
            
        destination.test = unwrappedMessages
        }
        
        
//        destination?.test = messages
        
//        if let messagesS = oneRecipient.newRelationship{
//            destination?.test = messagesS
//            print(destination?.test)
//        }
        
}

    
    


        
   // }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}