//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black

    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScanVC
        {
            destination.vehicleDB = vehicleDB
            destination.customerArray = customerArray
        }
        
        if let destination = segue.destination as? InputVC
        {
            destination.vehicleDB = vehicleDB
            destination.customerArray = customerArray
        }
    }
}
