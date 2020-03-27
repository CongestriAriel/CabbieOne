//
//  PeoplePageDTO.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

struct PeopleDTOResponse: Decodable {
    let peopleDTO: [PeopleDTO]?

    enum CodingKeys: String, CodingKey {
        case peopleDTO = "results"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.peopleDTO = try container.decode([PeopleDTO].self, forKey: .peopleDTO) ?? []
    }
}
struct PeopleDTO: Decodable {
    let name: String?
    let gender: String
    let dateOfBirth: String
    let films: [String]

    enum CodingKeys: String, CodingKey {
        case name = "name", dateOfBirth = "birth_year", gender, films
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.films = (try container.decode([String].self, forKey: .films)) ?? []
    }

    func mapToDomain() -> People {
        var movies = [Int]()
        films.forEach { (string) in
            var mutableString = string
            mutableString.removeFirst(27)
            mutableString.removeLast()
            if let int = Int(mutableString) {
                movies.append(int)
            }
        }
        return People(name: name, gender: gender, dateOfBirth: dateOfBirth, films: movies)
    }
}
