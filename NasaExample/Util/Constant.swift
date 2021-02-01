//
//  Constant.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import Foundation

final class Constant{
    static let baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    static let urlParams = "/photos?sol=1000&api_key="
    static let key = "DhpRBs9GjBb8urL1PadMnHSWlRUwAHWxdSJfnJDn"
    static let page = "&page="
    static let logo = "Nasa"
}

enum RoverType: String {
    case curiosity
    case opportunity
    case spirit

    var type: String {
        switch self {
        case .curiosity: return "curiosity"
        case .opportunity: return "opportunity"
        case .spirit : return "spirit "
        }
    }
}
