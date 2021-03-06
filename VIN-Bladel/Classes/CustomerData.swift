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
    var customerKey: String!
    var customerID: String!
    var customerTitle: String!
    var customerFirst: String!
    var customerLast: String!
    var customerEmail: String!

    var customerAddress1: String!
    var customerAddress2: String!
    var customerCity: String!
    var customerState: String!
    var customerZip: String!
    var customerCountry: String!
    var customerHomePhone: String!
    var customerWorkPhone: String!
    
    init(key: String, ID: String, title: String, first: String, last: String, address1: String, address2: String, city: String, state: String, zip: String, country: String, email: String, home: String, work: String) {
        customerKey = key
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
    
    func updateAField(field: String, value: String)
    {
        let customer = vehicleDatabase.child(customerKey)
        let customerField = [field: value]
        customer.updateChildValues(customerField)
    }
    
    func updateToDatabase() {
        let newCustomer = createNewCustomer()
        customerDatabase.child(customerKey).setValue(newCustomer)
        }
    
    func createNewCustomer() -> [String: String?]
    {
        let newCustomer = ["Customer Key": customerKey, "Customer ID": customerID, "Customer Title": customerTitle, "Customer First Name": customerFirst, "Customer Last Name": customerLast, "Customer Addr1": customerAddress1, "Customer Addr2": customerAddress2, "Customer City": customerCity, "Customer State": customerState, "Customer Zip Code": customerZip, "Customer Country": customerCountry, "Customer Email": customerEmail, "Customer Home Phone": customerHomePhone, "Customer Work Phone": customerWorkPhone]
        
        return newCustomer
    }
}
