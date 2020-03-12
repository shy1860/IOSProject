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
