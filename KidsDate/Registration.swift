//
//  Registration.swift
//  KidsDate
//
//  Created by David on 2020/3/10.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class Registration: UIViewController {
    @IBOutlet weak var txtRegUName: UITextField!

    @IBOutlet weak var thisLable: UILabel!
    @IBOutlet weak var txtRegPAgain: UITextField!
     @IBOutlet weak var txtRegP: UITextField!
     var db:DBHandler=DBHandler()
    var message:String=""
    @IBAction func btnDone1(_ sender: Any) {
        print("button pressed")
        if !isValidEmail(email: (txtRegUName.text)!){
            thisLable.text="This is not a valid email address"
            print("This is not a valid email")
            view.layoutIfNeeded() 
            return
        }
        else{
            if (txtRegP.text!) != (txtRegPAgain.text!){
                thisLable.text="Password not match"
                view.layoutIfNeeded()
                print("Password not match"+txtRegP.text!+txtRegPAgain.text!)
            }
            else{
                print("All good")
                var user:User=db.getUser(userName: txtRegUName.text!)
                print(user.userName)
                if user.userName == "" {
                    print(txtRegUName.text)
                     db.createUser(user: User(user: txtRegUName.text!, pwd: txtRegP.text!))
                    thisLable.text="You have successfully created your account!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                       // Your code with navigate to another controller
                        self.performSegue(withIdentifier: "regToLogin", sender: self)
                    }
                                    
                }
                else{
                    thisLable.text="User exists"
                }
               

               }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
    }
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
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
