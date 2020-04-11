//
//  EditViewController.swift
//  KidsDate
//
//  Created by Harmanpreet Kaur on 2020-04-10.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    let datePicker = UIDatePicker()
    var event:Event=Event();
    var user=User.currentUser;
    var db:DBHandler=DBHandler();

    
    @IBAction func btnSave(_ sender: Any) {
        event.title=txtEditTitle.text!
        event.location=txtEditLocation.text!
        event.date=txtEditDate.text!
        event.category=txtEditCategory.text!
        event.detail=txtEditDetail.text!
        
        db.updateEvent(event: event)
        self.performSegue(withIdentifier: "editBackToTable", sender: self)
        
    }
    @IBOutlet weak var txtEditDetail: UITextField!
    @IBOutlet weak var txtEditCategory: UITextField!
    @IBOutlet weak var txtEditDate: UITextField!
    @IBOutlet weak var txtEditLocation: UITextField!
    @IBOutlet weak var txtEditTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(event.detail+"this is event detail page")
        txtEditDate.text=event.date
        txtEditCategory.text=event.category
        txtEditLocation.text=event.location
        txtEditTitle.text=event.title
        txtEditDetail.text=event.detail
        
        createDatePicker()
        

        // Do any additional setup after loading the view.
    }
    
    func createDatePicker(){

        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneBtn =  UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)

        txtEditDate.inputAccessoryView = toolbar

        txtEditDate.inputView = datePicker


    }

    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strDate = formatter.string(from: datePicker.date)
        txtEditDate.text = strDate
       self.view.endEditing(true)
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
