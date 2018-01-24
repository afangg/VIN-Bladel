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
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var array = [UIImage]()
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        array.append(UIImage(named: "1")!)
        array.append(UIImage(named: "2")!)
        array.append(UIImage(named: "3")!)
        array.append(UIImage(named: "4")!)
        array.append(UIImage(named: "5")!)
        array.append(UIImage(named: "6")!)
        array.append(UIImage(named: "7")!)
        array.append(UIImage(named: "8")!)
        array.append(UIImage(named: "9")!)
        array.append(UIImage(named: "10")!)
        array.append(UIImage(named: "11")!)
        array.append(UIImage(named: "12")!)
        array.append(UIImage(named: "13")!)
        array.append(UIImage(named: "14")!)
        array.append(UIImage(named: "15")!)
        
        
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

        
        
        loops(array: array)
        
    }

    
    func loops(array: [UIImage] )
    {
        
        imageView.image = UIImage.animatedImage(with: array, duration: 0.5)
        
    }
    
    

}
