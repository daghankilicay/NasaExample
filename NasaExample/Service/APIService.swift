//
//  APIService.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    func getPhotos(roverType:String!,
                     page:Int,
                     completion:@escaping (DataResponse<BaseResult, AFError>) -> Void) {
        AF.request("\(Constant.baseUrl)\(roverType!)\(Constant.urlParams)\(Constant.key)\(Constant.page)\(page)").validate().responseDecodable(of: BaseResult.self) { response in
            completion(response)
        }
    }
}
