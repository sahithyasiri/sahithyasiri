//
//  ViewController.swift
//  BookAFlight
//
//  Created by Sahithya Sirimalla on 9/25/23.
//

import UIKit

class ViewController: UIViewController {
    let datePattern = #"^"#

    override func viewDidLoad() {
        super.viewDidLoad()
        onewaytripBTN.isEnabled = true
        roundtripout.isEnabled = true
        ticketconfirmationtv.text = " "
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ticketconfirmationtv: UITextView!
    

    @IBOutlet weak var onewaytripBTN: UIButton!
    
    @IBAction func onewaytrip(_ sender: UIButton) {
        roundtripout.isEnabled = false
        returnDateTF.isEnabled = false
        
    }
    
    @IBAction func roundtripBTN(_ sender: Any) {
        onewaytripBTN.isEnabled = false
        returnDateTF.isEnabled = true
    }
    @IBOutlet weak var roundtripout: UIButton!
    
    @IBOutlet weak var bookticketBTN: UIButton!
    
    @IBAction func bookticket(_ sender: UIButton) {
        guard let customername1 = self.custNameTF.text, !customername1.isEmpty else
        {ticketconfirmationtv.text = "name cannot be empty"
            return}
        guard let cityname1 = self.cityFromTF.text,
              !cityname1.isEmpty else
        {return}
        guard let cityname2 =
                self.cityToTF.text,
              !cityname2.isEmpty else
        {return}
        guard let date1 = self.departureDateTF.text, !date1.isEmpty else {return}
        guard let date2 = self.returnDateTF.text, !date2.isEmpty else {return}
        guard let noofpassengers = self.numpassTF.text, !noofpassengers.isEmpty,let numofpassengers = Double(noofpassengers) else {return}
        
        var price: Double
        switch numofpassengers{
        case 1...3: price = roundtripout.isEnabled ? numofpassengers * 1205.35 : numofpassengers * 890.50
            
        case 4...6: price = roundtripout.isEnabled ?
            numofpassengers * 631.25 : numofpassengers * 439.77
        case 7...: price = roundtripout.isEnabled ? numofpassengers * 491.21 :
            numofpassengers * 375.09
        default:
            price = 0.0
        }
        ticketconfirmationtv.text = "congratualtions \(customername1) your trip from \(cityname1) to \(cityname2) is confirmed for the ticket price \(price). your flight departs on \(date1)"
        
        
        
        
        
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        onewaytripBTN.isEnabled = true
        roundtripout.isEnabled = true
        custNameTF.text = ""
        cityFromTF.text = ""
        cityToTF.text = ""
        departureDateTF.text = ""
        returnDateTF.text = ""
        numpassTF.text = ""
    }
    
    
    @IBOutlet weak var custNameTF: UITextField!
    
    @IBOutlet weak var cityFromTF: UITextField!
    
    
    @IBOutlet weak var cityToTF: UITextField!
    
    
    @IBOutlet weak var departureDateTF: UITextField!
    
    
    @IBOutlet weak var returnDateTF: UITextField!
    
    
    @IBOutlet weak var numpassTF: UITextField!
    
    
}

