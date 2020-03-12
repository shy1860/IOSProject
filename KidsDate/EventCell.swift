//
//  EventCell.swift
//  KidsDate
//
//  Created by David on 2020/3/11.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var txtEventDetail: UITextView!
    @IBOutlet weak var txtEventLocation: UITextField!
    @IBOutlet weak var txtEventDate: UITextField!
    @IBOutlet weak var txtEventCategory: UITextField!
    @IBOutlet weak var txtEventTitle: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
