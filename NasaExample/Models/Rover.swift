//
//  Rover.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import Foundation

struct Rover: Decodable {
    let id: Int
    let name: String?
    let landingDate, launchDate: String
    let status: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
    }
}
