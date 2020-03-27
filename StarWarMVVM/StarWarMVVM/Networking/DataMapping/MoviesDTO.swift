//
//  MoviesDTO.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation

struct MoviesDTOResponse: Decodable {
    
    let moviesDTO: [MoviesDTO]

    enum CodingKeys: String, CodingKey {
        case moviesDTO = "results"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.moviesDTO = (try container.decode([MoviesDTO].self, forKey: .moviesDTO)) ?? []
    }
}

struct MoviesDTO: Decodable {
    
    let id: Int
    let title: String?
    let director: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id", title, director, releaseDate = "release_date"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        self.title = try? container.decode(String.self, forKey: .title)
        self.director = try? container.decode(String.self, forKey: .director)
        self.releaseDate = try? container.decode(String.self, forKey: .releaseDate)
    }

    func mapToDomain() -> Movie {
        return Movie(id: self.id, title: self.title, director: self.director, releaseDate: self.releaseDate)
    }
}
