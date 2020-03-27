//
//  MovieTableViewCell.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static var identifier = "MovieTableViewCell"
    static var nibName = "MovieTableViewCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fill(with object: MovieListItemViewModel) {
        title.text = object.title
        director.text = object.director
        date.text = object.releaseDate
    }
}
