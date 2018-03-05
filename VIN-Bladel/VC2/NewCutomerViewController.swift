//
//  NewCutomerViewController.swift
//  VIN-Bladel
//
//  Created by Olivia Marunde on 1/25/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class NewCutomerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newFirstName: UITextField!
    @IBOutlet weak var newLastName: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var newCustomer: CustomerData!
    var newCar: VehicleData!
    
    @IBAction func confirmNewInfo(_ sender: UIButton) {
        
        if newFirstName.text != "" && newLastName.text != "" && newEmail.text != ""
        {
            print(newFirstName.text)
            print(newLastName.text)
            newCustomer = CustomerData(key: "", ID: "", title: "", first: newFirstName.text!, last: newLastName.text!, address1: "1900 E Thomas", address2: "", city: "Arlington Heights", state: "IL", zip: "60004", country: "", email: newEmail.text!, home: "", work: "")
            
            customerArray.customerArray.addNewCustomer(newCustomer: newCustomer)
            newCar.vehicleCustomerID = newCustomer.customerID
        }
        
        performSegue(withIdentifier: "newCustomerToCarInfo", sender: nil)

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if newFirstName.text != "" && newLastName.text != "" && newEmail.text != ""
        {
            confirmButton.isEnabled = true
            confirmButton.backgroundColor = UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0)


        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.isEnabled = false
        confirmButton.layer.cornerRadius = 35
        confirmButton.layer.borderColor = UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0).cgColor
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.setTitleColor(UIColor(red:0.31, green:0.63, blue:0.46, alpha:1.0), for: .disabled)
        confirmButton.layer.borderWidth = 3

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarInfoViewController
        {
            destination.tbc?.car = newCar
            destination.tbc?.customer = newCustomer
        }
    }



}
