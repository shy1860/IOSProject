//
//  TableViewController.swift
//  KidsDate
//
//  Created by David on 2020/3/11.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var event:Event=Event()
    var user=User()
    var db:DBHandler=DBHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.readEventsValues()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBHandler.eventList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell=tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventCell

        // Configure the cell...
        cell.txtEventTitle.text=DBHandler.eventList[indexPath.row].title
        print(cell.txtEventTitle.text!+" event title")
        cell.txtEventDetail.text=DBHandler.eventList[indexPath.row].detail
        cell.txtEventDate.text=DBHandler.eventList[indexPath.row].date
        cell.txtEventLocation.text=DBHandler.eventList[indexPath.row].location
        cell.txtEventCategory.text=DBHandler.eventList[indexPath.row].category
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.event = DBHandler.eventList[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        if segue.identifier=="toDetail"{
            let page2=segue.destination as!DetailViewController
            page2.event=self.event
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
