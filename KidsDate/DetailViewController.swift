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
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDate.text=event.date
        lblCategory.text=event.category
        lblLocation.text=event.location
        lblTitle.text=event.title
        txtDetail.text=event.detail
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

}
