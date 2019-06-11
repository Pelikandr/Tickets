//
//  FlightListViewController.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/9/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FlightListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
        let testFlight = Flight(from: "Kyiv", to: "Odessa", takeoffTime: "12:20", landingTime: "14:40", price: 135, id: UUID().uuidString)
        DataSource.shared.append(flight: testFlight)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(refreshArray), for: .valueChanged)
        self.refreshControl = refreshControl
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.shared.FlightList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlightCell
        
        let flight = DataSource.shared.FlightList[indexPath.row]
        
        cell.travel.text = flight.from + " - " + flight.to
        cell.price.text = String(flight.price) + "$"
        cell.travelTimeRange.text = flight.takeoffTime + " - " + flight.landingTime
        cell.travelTime.text = timeDifference(dateStr1: flight.takeoffTime, dateStr2: flight.landingTime)
        
        return cell
    }
    
    @objc func refreshArray() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    private lazy var dateFormatter = DateFormatter()
    private func timeDifference(dateStr1: String, dateStr2: String) -> String {
        dateFormatter.dateFormat = "HH:mm"
        let date1 = dateFormatter.date(from: dateStr1)
        let date2 = dateFormatter.date(from: dateStr2)
        let hourDifference = Calendar.current.dateComponents([.hour], from: date1!, to: date2!)
        let minuteDifference = Calendar.current.dateComponents([.minute], from: date1!, to: date2!)
        let hour = Calendar.current.date(from: hourDifference as DateComponents)
        let minute = Calendar.current.date(from: minuteDifference as DateComponents)
        dateFormatter.dateFormat = "h"
        let hourStr = dateFormatter.string(from: hour!)
        dateFormatter.dateFormat = "m"
        let minuteStr = dateFormatter.string(from: minute!)
        let difference = hourStr + "h " + minuteStr + "min"

        return difference
    }

}
