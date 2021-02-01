//
//  Camera.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import Foundation

struct Camera: Decodable {
    let id: Int
    let name: String?
    let roverID: Int
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}
