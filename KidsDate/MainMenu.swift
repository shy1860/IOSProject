//
//  MainMenu.swift
//  KidsDate
//
//  Created by David on 2020/3/9.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {
    var user1=User()
    var db=DBHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title="Logout"
        // Do any additional setup after loading the view.
   
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        
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
