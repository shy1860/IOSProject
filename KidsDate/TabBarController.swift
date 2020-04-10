//
//  TabBarController.swift
//  KidsDate
//
//  Created by David on 2020/4/10.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController ,UITabBarControllerDelegate{

    var user=User()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        print(user.userName+" Use name!!!")
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item:\(self.selectedIndex)")
        print(item.tag)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let firstVC = viewController as? CreateViewController {
            print("this is the firstVC")
        }

        if viewController is CreateViewController {
            print("First tab")
        } else if viewController is TabBarController {
            print("Second tab")
        } else{
            print(type(of: viewController))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
          
           print(type(of: segue.destination))
        let createViewController=segue.destination as! CreateViewController
        createViewController.user=user;
        print(user.userName+" prepare!")
           if(segue.identifier == "toCreate"){
              print(user.userName+" To List contoller user name!")
               let tableViewController = segue.destination as! TabBarController
               tableViewController.user = user
           }
           if(segue.identifier == "toReg"){
               
           }

           if(segue.identifier == "toReset"){
               
           }else{
               
           }

         
           
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
