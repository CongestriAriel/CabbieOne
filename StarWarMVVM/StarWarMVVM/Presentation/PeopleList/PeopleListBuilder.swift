//
//  File.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit

class PeopleListBuilder {

    static func start(movieId: Int, navigation: UINavigationController?) -> PeopleListViewController {
        let view = PeopleListViewController()
        let model = PeopleListViewModel(movieId: movieId)
        let router = PeopleListRouter()

        router.navigationController = navigation
        model.router = router
        view.viewModel = model

        return view
    }
}
