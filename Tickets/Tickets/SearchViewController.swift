//
//  SearchViewController.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var departDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let datePickerDate = departDatePicker.date
    }

    @IBAction func searchTickets(_ sender: Any) {
        if fromTextField.text == "" && toTextField.text == "" {
            showNoTextError()
        } else {
            
            DataSource.shared.filterList(by: fromTextField.text!, to: toTextField.text!, date: getDateString(date: departDatePicker.date))
        }
        self.performSegue(withIdentifier: "toFlightsListViewController", sender: nil)
        
    }
    private lazy var dateFormatter = DateFormatter()
    func getDateString(date: Date) -> String {
        dateFormatter.dateFormat = "EEEE, d MMM yyyy"
        let dateStr = dateFormatter.string(from: date)
        debugPrint(dateStr)
        return dateStr
    }
    
    func showNoTextError() {
        let alertController = UIAlertController(title: "Error", message: "Enter any city", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fromTextField.resignFirstResponder()
        toTextField.resignFirstResponder()
    }
    
}
