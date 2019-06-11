//
//  FlightCell.swift
//  Tickets
//
//  Created by Denis Zayakin on 6/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {

    @IBOutlet weak var travel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var travelTimeRange: UILabel!
    @IBOutlet weak var travelTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        travel.text = nil
        price.text = nil
        travelTimeRange.text = nil
        travelTime.text = nil
    }
}
