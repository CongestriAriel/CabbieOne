//
//  File.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit

class MovieListBuilder {

    static func start(navigation: UINavigationController?) -> MovieListViewController {
        let view = MovieListViewController()
        let model = MovieListViewModel()
        let router = MovieListRouter()

        router.navigationController = navigation
        model.router = router
        view.viewModel = model

        return view
    }
}
