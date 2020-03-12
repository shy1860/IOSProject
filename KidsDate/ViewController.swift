//
//  ViewController.swift
//  KidsDate
//
//  Created by David on 2020/3/9.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    
    @IBOutlet weak var createdOn: UITextView!
    @IBOutlet var lbl: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    let db:DBHandler=DBHandler()

    @IBAction func btnLogin(_ sender: Any) {
        User.userLogin=User(user:txtUserName.text! ,pwd:txtPWD.text!)
        createdOn.text=User.userLogin.createdAt;
        //db.createUser(user: User.userLogin)
        db.readUsersValues()
        db.insertEvent(event: Event(title: "Baseball Kids 5-6", detail: "Would like a kids between 5-6 sharing equipment and experience", date: "202004021000", location: "Casa Loma Castle Room 101", category: "Outdoor", ownerID: "2"))
        db.insertEvent(event: Event(title: "Basketball  Teen 13-16", detail: "Need 5 members as routine team for competition", date: "202004031130", location: "TBA", category: "Indoor", ownerID: "1"))
        db.insertEvent(event: Event(title: "Swimming learner all age", detail: "Wanna improve swimming skills? Come here or call 647 666 6666", date: "202009131400", location: "Community Center", category: "Indoor", ownerID: "3"))
        db.insertEvent(event: Event(title: "Hiking", detail: "No more skills, just walk! Entry fee $100.00", date: "202003200800", location: "Algonquin Park", category: "Outdoor", ownerID: "2"))
        db.insertEvent(event: Event(title: "Crafting seminar", detail: "Any age welcome, bring your own tools", date: "202004021000", location: "Rogers Center", category: "Indoor", ownerID: "21"))
        db.readEventsValues()
    }
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        let user=User(user:txtUserName.text! ,pwd:txtPWD.text!)
        if(segue.identifier == "toMain"){
           
        }
        if(segue.identifier == "toReg"){
            
        }
        if(segue.identifier == "toReset"){
            
        }else{
            
        }

      
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       

}

}
