//
//  CreateViewController.swift
//  KidsDate
//
//  Created by Harmanpreet Kaur on 2020-04-09.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    let datePicker = UIDatePicker()
    var user=User.currentUser;
    var db:DBHandler=DBHandler()
    
    @IBAction func btnCrLogOut(_ sender: Any) {
        self.performSegue(withIdentifier: "createToLogin", sender: self)
        
    }
    @IBOutlet weak var btnCrLogout: UIButton!
    @IBAction func btnSubmitCrt(_ sender: Any) {
        db.createEvent(event: Event(title: txtTitle.text!, detail: txtDetails.text!, date: txtDate.text!, location: txtLocation.text!, category: txtCategory.text!,ownerID: String(user.id)), user: user)
        
        self.performSegue(withIdentifier: "segue1", sender: self)
        
        
    }
    
    @IBOutlet weak var txtDetails: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        print(user.userName+"user name")
        

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    func createDatePicker(){

        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneBtn =  UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)

        txtDate.inputAccessoryView = toolbar

        txtDate.inputView = datePicker


    }

    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strDate = formatter.string(from: datePicker.date)
        txtDate.text = strDate
       self.view.endEditing(true)
    }
    


}

