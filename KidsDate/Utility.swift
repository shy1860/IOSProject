//
//  Utility.swift
//  KidsDate
//
//  Created by David on 2020/3/10.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation
import SQLite3
var db:OpaquePointer?
var userList=[User]()
var stmt:OpaquePointer?
func createUser(user:User){
    createDB()
    let insertQ="INSERT INTO USERS (name,password) VALUES(?,?)"
    if sqlite3_prepare(db,insertQ,-1,&stmt,nil) != SQLITE_OK{
        print("Error binding query insert into users")
    }
    if sqlite3_bind_text(stmt, 1, user.userName, -1, nil) != SQLITE_OK {
        print("Error binding name")
    }
    if sqlite3_bind_text(stmt, 2, user.password, -1, nil) != SQLITE_OK {
        print("Error binding password")
    }
    if sqlite3_step(stmt) == SQLITE_DONE {
        print("Users saved successfully")
    }
}
func createDB(){
    let fileUrl=try!
               FileManager.default.url(for:.documentDirectory,
                   in:.userDomainMask,appropriateFor: nil,create: false).appendingPathComponent("KidsDate.sqlite")
           if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
               print("Error opening database")
               return
           }
           print(fileUrl.path)
           let createTableQuery="CREATE TABLE IF NOT EXISTS USERS(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,password TEXT)"
           if sqlite3_exec(db,createTableQuery,nil,nil,nil) != SQLITE_OK{
               print("ERROR creating table users")
               return
           }
           print("everything ok")
}
 func readValues(){

       //first empty the list of heroes
       userList.removeAll()

       //this is our select query
       let queryString = "SELECT * FROM USERS"

       //statement pointer
       var stmt:OpaquePointer?

       //preparing the query
       if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
           let errmsg = String(cString: sqlite3_errmsg(db)!)
           print("error preparing insert: \(errmsg)")
           return
       }

       //traversing through all the records
       while(sqlite3_step(stmt) == SQLITE_ROW){
           let id = sqlite3_column_int(stmt, 0)
           let name = String(cString: sqlite3_column_text(stmt, 1))
           let password = sqlite3_column_int(stmt, 2)

           //adding values to list
        userList.append(User(id: Int(id), user: String(describing: name), pwd: String(password)))
       }
   }
