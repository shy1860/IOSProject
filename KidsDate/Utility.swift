//
//  Utility.swift
//  KidsDate
//
//  Created by David on 2020/3/10.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation
import SQLite3
    
class DBHandler{
    let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
    static var userList=[User]()
    static var eventList=[Event]()
    var stmt:OpaquePointer?
    init()
    {
        db = openDatabase()
        createUserTable()
        createEventTable()
    }

    let dbPath: String = "KidsDate.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(fileURL.path)")
            return db
        }
    }
    func createUserTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS USERS(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE,password TEXT,createAT DATETIME DEFAULT CURRENT_TIMESTAMP)"
          var createTableStatement: OpaquePointer? = nil
          if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
          {
              if sqlite3_step(createTableStatement) == SQLITE_DONE
              {
                  print("person table created.")
              } else {
                  print("person table could not be created.")
              }
          } else {
              print("CREATE TABLE statement could not be prepared.")
          }
          sqlite3_finalize(createTableStatement)
      }
    func createEventTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS EVENTS(id INTEGER PRIMARY KEY AUTOINCREMENT, ownerEmail Text,title TEXT,detail TEXT,date DATETIME,location TEXT,category TEXT,ownerID TEXT,createAT DATETIME DEFAULT CURRENT_TIMESTAMP)"
          var createTableStatement: OpaquePointer? = nil
          if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
          {
              if sqlite3_step(createTableStatement) == SQLITE_DONE
              {
                  print("person table created.")
              } else {
                  print("person table could not be created.")
              }
          } else {
              print("CREATE TABLE statement could not be prepared.")
          }
          sqlite3_finalize(createTableStatement)
      }
    func createEvent(event:Event,user:User){
        print("Start to create Event")
        print("Title:" + event.title+" Detail: " + event.detail)
        print(" Location:  "+event.location+" Date:  "+event.date)
        print(" Category: "+event.category+" OwnerID: "+event.ownerID)
        let insertQ="INSERT INTO EVENTS (title,detail,date,location,category,ownerID,ownerEmail) VALUES(?,?,?,?,?,?,?)"
        if sqlite3_prepare(db,insertQ,-1,&stmt,nil) != SQLITE_OK{
            print("Error binding query insert into events")
        }
        if sqlite3_bind_text(stmt, 1, event.title, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding title")
        }
        if sqlite3_bind_text(stmt, 2, event.detail, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding detail")
        }
        if sqlite3_bind_text(stmt, 3, event.date, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding date")
        }
        if sqlite3_bind_text(stmt, 4, event.location, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding location")
        }
        if sqlite3_bind_text(stmt, 5, event.category, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding category")
        }
        if sqlite3_bind_text(stmt, 6, event.ownerID, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding ownerID")
        }
        if sqlite3_bind_text(stmt, 7, user.userName, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding ownerEmail")
        }

        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Event saved successfully")
        }else{
            print(sqlite3_step(stmt))
        }
    }


    func createUser(user:User){
        print("Start to create users")
        let insertQ="INSERT INTO USERS (name,password) VALUES(?,?)"
        //let insertQ="INSERT INTO USERS (name,password) VALUES('cc','dd');"
        if sqlite3_prepare(db,insertQ,-1,&stmt,nil) != SQLITE_OK{
            print("Error binding query insert into users")
        }
        if sqlite3_bind_text(stmt, 1, user.userName, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding name")
        }
        if sqlite3_bind_text(stmt, 2, user.password, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding password")
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print(user.userName)
            print("Users saved successfully")
        }else{
            print(sqlite3_step(stmt))
        }
        print(insertQ)
        print(user.userName+user.password)
    }
     func readUsersValues(){

           //first empty the list of heroes
        DBHandler.userList.removeAll()

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
            print(id)
               let name = String(cString: sqlite3_column_text(stmt, 1))
            print(name)
               let password = sqlite3_column_int(stmt, 2)

               //adding values to list
            DBHandler.userList.append(User(id: Int(id), user: String(describing: name), pwd: String(password)))
           }
       }
    func deleteEvent(event:Event){
        let deleteStatementString = "DELETE FROM EVENTS WHERE Id = ?;"
        var deleteStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) ==
            SQLITE_OK {

            if sqlite3_bind_int(deleteStatement, 1, Int32(event.id)) != SQLITE_OK {
                print("Error binding name")
            }
            
            
          if sqlite3_step(deleteStatement) == SQLITE_DONE {
            print("\nSuccessfully deleted row.")
          } else {
            print("\nCould not delete row.")
          }
        } else {
          print("\nDELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
        

    }
    func updateEvent(event:Event){
       let updateStatementString = "UPDATE Events SET title = ?,detail=?,date=?,location=?,category=? WHERE Id = ?;"
          var updateStatement: OpaquePointer?
        print(event.title+" ||||||"+event.detail)
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) ==
            SQLITE_OK {
            print(event.title+" "+event.detail)
            if sqlite3_bind_int(updateStatement, 6, Int32(event.id)) != SQLITE_OK {
                           print("Error binding eventID")
                       }
            if sqlite3_bind_text(updateStatement, 1, event.title, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                print("Error binding title")
            }
            if sqlite3_bind_text(updateStatement, 2, event.detail, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                print("Error binding detail")
            }
            if sqlite3_bind_text(updateStatement, 3, event.date, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                print("Error binding date")
            }
            if sqlite3_bind_text(updateStatement, 4, event.location, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                print("Error binding location")
            }
            if sqlite3_bind_text(updateStatement, 5, event.category, -1, SQLITE_TRANSIENT) != SQLITE_OK {
                print("Error binding category")
            }
          if sqlite3_step(updateStatement) == SQLITE_DONE {
            print("\nSuccessfully updated row.")
          } else {
            print("\nCould not update row.")
          }
        } else {
          print("\nUPDATE statement is not prepared")
        }
        sqlite3_finalize(updateStatement)

    }
    func readEventsValues(){
        print("Start to query events")
        //first empty the list of heroes
     DBHandler.eventList.removeAll()

        //this is our select query
        let queryString = "SELECT * FROM EVENTS"

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
         print(id)
            let title = String(cString: sqlite3_column_text(stmt, 2))
         print(title)
            let detail = String(cString:sqlite3_column_text(stmt, 3))
            print(detail)
            let date = String(cString: sqlite3_column_text(stmt, 4))
            print(date)
            let location = String(cString: sqlite3_column_text(stmt, 5))
            print(location)
            let category = String(cString: sqlite3_column_text(stmt, 6))
            print(category)
            let ownerID = String(cString: sqlite3_column_text(stmt, 7))
            print(ownerID)
            let ownerEmail = String(cString: sqlite3_column_text(stmt, 1))
            print(ownerID)
            //adding values to list
         DBHandler.eventList.append(Event(id: Int(id), title: title, detail: detail, date: date, location: location, category: category, ownerID: ownerID,ownerEmail: ownerEmail))
        }
    }
    func getUser(userName:String)->User{
        let queryString = "SELECT * FROM USERS WHERE NAME LIKE'"+userName+"';"
        print(queryString)
        var user=User()
        //statement pointer
        var stmt:OpaquePointer?

        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return user
        }

        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            user.id = Int(sqlite3_column_int(stmt, 0))
            print(String(user.id))
            user.userName = String(cString: sqlite3_column_text(stmt, 1))
            print(user.userName)
            user.password = String(cString: sqlite3_column_text(stmt, 2))
            user.createdAt = String(cString: sqlite3_column_text(stmt, 3))
            
        }
        print("User name: "+userName)
        print(user.userName+user.password)
        return user
    }



}
