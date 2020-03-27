//
//  MovieListRouter.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit

class MovieListRouter {

    var navigationController: UINavigationController?

        func goToPeopleList(movieId: Int) {
            navigationController?.pushViewController(PeopleListBuilder.start(movieId: movieId, navigation: navigationController), animated: true)
        }
}
