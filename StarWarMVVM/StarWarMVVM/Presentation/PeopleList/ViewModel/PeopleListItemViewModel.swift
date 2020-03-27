//
//  PeopleListItemViewModel.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 27/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

struct PeopleListItemViewModel {
    let name: String
    let dateOfBirth: String
    let gender: String

    public init(people: People) {
        self.name = people.name ?? "No Info"
        self.gender = people.gender ?? "No Info"
        let dateOfBirthString = people.dateOfBirth
        self.dateOfBirth = "Date of Birth: \(dateOfBirthString)"
    }

}

