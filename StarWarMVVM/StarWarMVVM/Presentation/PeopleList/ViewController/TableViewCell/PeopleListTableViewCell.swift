//
//  PeopleListTableViewCell.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 27/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit

class PeopleListTableViewCell: UITableViewCell {
    
    static var identifier = "PeopleListTableViewCell"
    static var nibName = "PeopleListTableViewCell"
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fill(with object: PeopleListItemViewModel) {
        name.text = object.name
        gender.text = object.gender
        date.text = object.dateOfBirth
    }

}
