//
//  CreateViewController.swift
//  KidsDate
//
//  Created by Harmanpreet Kaur on 2020-04-09.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var btnSubmitCreate: UIButton!
    @IBOutlet weak var txtDetails: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    
    let datePicker = UIDatePicker()
    var user:User=User();
    var db:DBHandler=DBHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        

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
        //datePicker.datePickerMode = .date


    }

    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        let strDate = dateFormatter.string(from: datePicker.date)
        txtDate.text = strDate


       self.view.endEditing(true)
    }
    


}

