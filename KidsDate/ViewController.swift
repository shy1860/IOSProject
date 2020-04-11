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
    @IBOutlet weak var lblWarning: UILabel!
    let db:DBHandler=DBHandler()
    var currentUser=User()
    @IBAction func btnLogin(_ sender: Any) {
        
        User.userLogin=User(user:txtUserName.text! ,pwd:txtPWD.text!)
        print(txtUserName.text!+txtPWD.text!)
        currentUser = db.getUser(userName: txtUserName.text!)
        if currentUser.userName.isEqual(""){
            lblWarning.text="No such a user!"
        }else{
            if currentUser.password != User.userLogin.password{
                lblWarning.text="Wrong password!"
            }else{

                db.readEventsValues()
                User.currentUser=currentUser;
                self.performSegue(withIdentifier: "toMain", sender: self)
            }
        }

    }
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        let user=User(user:txtUserName.text! ,pwd:txtPWD.text!)
       
        print(type(of: segue.destination))
        if(segue.identifier == "toMain"){
           print(user.userName+" To List contoller user name!")
            let tableViewController = segue.destination as! TabBarController
            tableViewController.user = currentUser
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
