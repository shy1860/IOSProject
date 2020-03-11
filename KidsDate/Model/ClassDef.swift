//
//  ClassDef.swift
//  KidsDate
//
//  Created by David on 2020/3/9.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation
class User{
    var id:Int=0;
    var userName:String="";
    var password:String="";
    var createdAt:String="";
    init (){
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full

        dateFormatter.timeStyle = .full

        self.createdAt = dateFormatter.string(from: currentDate)
    }
    init(user:String,pwd:String) {
        self.userName=user;
        self.password=pwd;
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full

        dateFormatter.timeStyle = .full

        self.createdAt = dateFormatter.string(from: currentDate)
        
    }
    init(id:Int,user:String,pwd:String) {
        self.id=id
        self.userName=user;
        self.password=pwd;
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full

        dateFormatter.timeStyle = .full

        self.createdAt = dateFormatter.string(from: currentDate)
        
    }
    
}
