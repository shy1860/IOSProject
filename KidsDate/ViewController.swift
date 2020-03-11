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

    @IBAction func btnLogin(_ sender: UIButton) {
          let user=User(user:txtUserName.text! ,pwd:txtPWD.text!)
          createdOn.text=user.createdAt;
        createUser(user: user)
    }
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        let user=User(user:txtUserName.text! ,pwd:txtPWD.text!)
        if(segue.identifier == "toMain"){
            let page2=segue.destination as! MainMenu
            page2.user1=user
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
