//
//  LoadingViewController.swift
//  VIN-Bladel
//
//  Created by Will Stiefbold on 1/22/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class LoadingViewController: UIViewController {
    
    var databaseReference = Database.database().reference()
    var customerDatabase: DatabaseReference?
    var vehicleDatabase: DatabaseReference?
    
    var customerArray: [CustomerData] = []
    
    
    
    
    
    var array = [UIImage]()
    
    var image1 = UIImage(named: "1")

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerDatabase = databaseReference.root.child("customers")
        vehicleDatabase = databaseReference.root.child("vehicle")
        customerDatabase?.observe(.value) { (snapshot) in
            for customers in snapshot.children.allObjects as! [DataSnapshot]
            {
                let object = customers.value as? [String: AnyObject]
                let ID = object?["Customer ID"] as! String
                let title = object?["Customer Title"] as! String
                let first = object?["Customer First Name"] as! String
                let last = object?["Customer Last Name"] as! String
                
                let add1 = object?["Customer Addr1"] as! String
                let add2 = object?["Customer Addr2"] as! String
                let city = object?["Customer City"] as! String
                let state = object?["Customer State"] as! String
                let country = object?["Customer Country"] as! String
                let zip = object?["Customer Zip Code"] as! String
                
                let email = object?["Customer Email"] as! String
                let home = object?["Customer Home Phone"] as! String
                let work = object?["Customer Work Phone"] as! String


                let customer = CustomerData(ID: ID, title: title, first: first, last: last, address1: add1, address2: add2, city: city, state: state, zip: zip, country: country, email: email, home: home, work: work)
                
                self.customerArray.append(customer)

                
            }
        }
//        array.append(image1!)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            print(self.customerArray[0].customerFirst)

        }
        
    }



}
