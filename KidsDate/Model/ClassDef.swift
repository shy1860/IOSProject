//
//  ClassDef.swift
//  KidsDate
//
//  Created by David on 2020/3/9.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class User{
    static var userLogin:User = User()
    var id:Int=0;
    var userName:String="";
    var password:String="";
    var createdAt:String="";
    static var currentUser=User();
    
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

class Event{
    static var eventToPast:Event = Event()
    var id:Int=0;
    var title:String="";
    var detail:String="";
    var date:String="";
    var location:String="";
    var category:String="";
    var ownerID:String="";
    var createdAt:String="";
    var ownerEmail:String="";

    init (){
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full

        dateFormatter.timeStyle = .full

        self.createdAt = dateFormatter.string(from: currentDate)
    }
    init(title:String,detail:String,date:String,location:String,category:String,ownerID:String) {
        self.title=title;
        self.detail=detail;
        self.location=location;
        self.date=date;
        self.category=category;
        self.ownerID=ownerID;
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full

        dateFormatter.timeStyle = .full

        self.createdAt = dateFormatter.string(from: currentDate)
        
    }
    init(id:Int,title:String,detail:String,date:String,location:String,category:String,ownerID:String,ownerEmail:String) {
        self.id=id
        self.title=title;
        self.detail=detail;
        self.location=location;
        self.date=date;
        self.category=category;
        self.ownerID=ownerID;
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        self.createdAt = dateFormatter.string(from: currentDate)
        self.ownerEmail=ownerEmail
    }
    
}

