//
//  customerData.swift
//  VIN-Bladel
//
//  Created by Alisha Fong on 1/23/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
var customerDatabase = Database.database().reference().root.child("customers")

class CustomerData
{
    var customerID: String!
    var customerTitle: String!
    var customerFirst: String!
    var customerLast: String!

    var customerAddress1: String!
    var customerAddress2: String!
    var customerCity: String!
    var customerState: String!
    var customerZip: String!
    var customerCountry: String!
    var customerEmail: String!
    var customerHomePhone: String!
    var customerWorkPhone: String!
    
    init(ID: String, title: String, first: String, last: String, address1: String, address2: String, city: String, state: String, zip: String, country: String, email: String, home: String, work: String) {
        customerID = ID
        customerTitle = title
        customerFirst = first
        customerLast = last
        customerAddress1 = address1
        customerAddress2 = address2
        customerCity = city
        customerState = state
        customerZip = zip
        customerCountry = country
        customerEmail = email
        customerHomePhone = home
        customerWorkPhone = work
    }
    
    func updateToDatabase() {
        let newCustomer = ["Customer ID": customerID, "Customer Title": customerTitle, "Customer First": customerFirst, "Customer Last": customerLast, "Customer Addr1": customerAddress1, "Customer Addr2": customerAddress2, "Customer City": customerCity, "Customer State": customerState, "Customer Zip Code": customerZip, "Customer Country": customerCountry, "Customer Email": customerEmail, "Customer Home Phone": customerHomePhone, "Customer Work Phone": customerWorkPhone]
        
        customerDatabase.child(customerID).setValue(newCustomer)
        
        
    }

}
