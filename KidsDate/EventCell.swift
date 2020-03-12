//
//  EventCell.swift
//  KidsDate
//
//  Created by David on 2020/3/11.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var detailCell: UIView!
    @IBOutlet weak var txtEventDetail: UILabel!
    @IBOutlet weak var txtEventLocation: UILabel!
    @IBOutlet weak var txtEventDate: UILabel!
    @IBOutlet weak var txtEventCategory: UILabel!
    @IBOutlet weak var txtEventTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
