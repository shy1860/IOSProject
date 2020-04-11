//
//  DetailViewController.swift
//  KidsDate
//
//  Created by David on 2020/3/12.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var txtDetail: UITextView!
    var event:Event=Event();
    var user=User.currentUser;
    var db:DBHandler=DBHandler();
    
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBAction func btnDetailLogout(_ sender: Any) {
         self.performSegue(withIdentifier: "detailToLogin", sender: self)
    }
    @IBAction func btnDelete(_ sender: Any) {
        
        db.deleteEvent(event:event)
        print("event has been deleted")
        self.performSegue(withIdentifier: "backToTable", sender: self)
        
        
    }
    @IBAction func btnEdit(_ sender: Any) {
        print("editing")
    }
    @IBAction func editBtn(_ sender: Any) {
        
        print("going to update event")
        
        self.performSegue(withIdentifier: "toEdit", sender: self)
              
    }
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        if segue.identifier=="toEdit"{
            let page2=segue.destination as! EditViewController
            page2.event=self.event
            page2.user=self.user
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        print(event.detail+"this is event detail page")
        lblDate.text=event.date
        lblCategory.text=event.category
        lblLocation.text=event.location
        lblTitle.text=event.title
        txtDetail.text=event.detail
        // Do any additional setup after loading the view.
//        print(user.id)
//        print(event.ownerID)
        if String(user.id) != String(event.ownerID){
            btnDelete.isHidden = true;
            btnEdit.isHidden = true;
            
            print(String(user.id) + "userid")
            print(event.ownerID + "ownerid are differrent")
           

        }
        
        
        
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
