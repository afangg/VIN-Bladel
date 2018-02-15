//
//  ViewController.swift
//  VIN-Bladel
//
//  Created by Joel Koreth on 12/1/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    var customerReference = Database.database().reference().root.child("customers")

    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var manualButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        scanButton.layer.cornerRadius = 60
        manualButton.backgroundColor = UIColor(red:0.32, green:0.58, blue:0.79, alpha:1.0)
        manualButton.layer.cornerRadius = 60
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.navigationController?.isNavigationBarHidden = false

        
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
