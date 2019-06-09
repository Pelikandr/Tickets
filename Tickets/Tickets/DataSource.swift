//
//  DataSource.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

struct Flight {
    let from: String
    let to: String
    //let returnDate : Date
    //let departDate : Date
    let id: String
    }


class DataSource {
    
    static var shared = DataSource()
    
    private(set) var FlightList: [Flight] = []
    
    func append(flight: Flight) {
        self.FlightList.append(flight)
    }
    
    func update(_ flight: Flight) {
        if let index = FlightList.firstIndex(where: { $0.id == flight.id }) {
            FlightList[index] = flight
        }
    }
    
    func remove(_ flight: Flight) {
        if let index = FlightList.firstIndex(where: { $0.id == flight.id }) {
            FlightList.remove(at: index)
        }
    }
}

