//
//  MainMenu.swift
//  KidsDate
//
//  Created by David on 2020/3/9.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class MainMenu: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var user1=User()
    @IBOutlet  var tableUserVu: [UITableView]!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           //this method is giving the row count of table view which is
           //total number of heroes in the list
           return userList.count
       }
    
    
       //this method is binding the hero name with the tableview cell
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
           let user: User
           user = userList[indexPath.row]
           cell.textLabel?.text = user.userName
           return cell
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        readValues()
        
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
