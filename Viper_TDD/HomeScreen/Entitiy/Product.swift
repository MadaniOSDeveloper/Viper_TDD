//
//  Product.swift
//  Viper_TDD
//
//  Created by Madan on 17/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//
import Foundation
class Product: Codable {
    var id: String?
    var name: String?
    var description: String?
    var imageLink: String?
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case description
        case imageLink = "image"
    }
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        imageLink = try values.decode(String.self, forKey: .imageLink)
    }
}
