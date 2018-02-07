//
//  LoadingViewController.swift
//  VIN-Bladel
//
//  Created by Will Stiefbold on 1/22/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var seugeInstantly = false
    
    var array = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10"), UIImage(named: "11"), UIImage(named: "12"), UIImage(named: "13"), UIImage(named: "14"), UIImage(named: "15"), UIImage(named: "16"), UIImage(named: "17"), UIImage(named: "18"), UIImage(named: "19"), UIImage(named: "20"), UIImage(named: "21"), UIImage(named: "22"), UIImage(named: "23"), UIImage(named: "24"), UIImage(named: "25"), UIImage(named: "26"), UIImage(named: "27"), UIImage(named: "28"), UIImage(named: "29"), UIImage(named: "30"), UIImage(named: "31"), UIImage(named: "32"), UIImage(named: "33"), UIImage(named: "34"), UIImage(named: "35"), UIImage(named: "36"), UIImage(named: "37"), UIImage(named: "38"), UIImage(named: "39"), UIImage(named: "40"), UIImage(named: "41"), UIImage(named: "42"), UIImage(named: "43"), UIImage(named: "44"), UIImage(named: "45"), UIImage(named: "46"), UIImage(named: "47"), UIImage(named: "48"), UIImage(named: "49"), UIImage(named: "50"), UIImage(named: "51"), UIImage(named: "52"), UIImage(named: "53"), UIImage(named: "54"), UIImage(named: "55"), UIImage(named: "56"), UIImage(named: "57"), UIImage(named: "58"), UIImage(named: "59"), UIImage(named: "60")]

    var customerArray = CustomerDB()
    var vehicleDB = VehicleDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        loops(array: array as! [UIImage])
        if Reachability.isConnectedToNetwork(){
            
    
 
        }
        else {
//            TODO
//                Add Error dialog without internet
//            let alert = UIAlertController(title: "ERROR", message: "No Internet Connection", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        }
        
        firstSegu()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if seugeInstantly == true
        {
            otherSegu()
        }
    }
    
    
    
    
    
    func loops(array: [UIImage] )
    {
        imageView.image = UIImage.animatedImage(with: array, duration: 2.5)
        self.customerArray.pullFromFirebase()
        self.vehicleDB.pullFromFirebase()
    }
    
    
    func firstSegu()
    {
        
        let randomNumber = Int(arc4random_uniform(3) + 5)
        let when = DispatchTime.now() + Double(randomNumber)
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            self.seugeInstantly = true
            self.performSegue(withIdentifier: "loadingToMain", sender: nil)
        }

    }
    
    func otherSegu()
    {
        self.performSegue(withIdentifier: "loadingToMain", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController
        {
            let destination = segue.destination as? ViewController
            destination?.vehicleDB = vehicleDB
            destination?.customerArray = customerArray
        }
    }

}
