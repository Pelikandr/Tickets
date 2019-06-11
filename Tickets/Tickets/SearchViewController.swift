//
//  SearchViewController.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit


class SearchViewController: UITableViewController {
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func searchTickets(_ sender: Any) {
        if fromTextField.text == "" && toTextField.text == "" {
            showNoTextError()
        } else {
            DataSource.shared.filterList(by: fromTextField.text!, to: toTextField.text!)
        }
        self.performSegue(withIdentifier: "toFlightsListViewController", sender: nil)
        
    }
    func showNoTextError() {
        let alertController = UIAlertController(title: "Error", message: "Enter any city", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    
}
