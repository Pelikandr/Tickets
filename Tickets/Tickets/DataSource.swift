//
//  DataSource.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation
import UIKit

struct Flight {
    let from: String
    let to: String
    let takeoffTime: String
    let landingTime: String
    let price: Int
    let id: String
    }


class DataSource {
    
    static var shared = DataSource()
    
    private(set) var flightList: [Flight] = []
    private(set) var filteredFlightList: [Flight] = []
    
    func append(flight: Flight) {
        self.flightList.append(flight)
    }
    
    func update(_ flight: Flight) {
        if let index = flightList.firstIndex(where: { $0.id == flight.id }) {
            flightList[index] = flight
        }
    }
    
    func remove(_ flight: Flight) {
        if let index = flightList.firstIndex(where: { $0.id == flight.id }) {
            flightList.remove(at: index)
        }
    }
    
    func filterList(by from: String, to: String, date: String) {
        if from != "" {
            filteredFlightList = flightList.filter({ $0.from.lowercased().contains(from.lowercased()) })
        }
        if to != "" {
            filteredFlightList = filteredFlightList.filter({ $0.to.lowercased().contains(to.lowercased()) })
        }
        filteredFlightList = filteredFlightList.filter({ $0.takeoffTime.contains(date) })
    }
}

