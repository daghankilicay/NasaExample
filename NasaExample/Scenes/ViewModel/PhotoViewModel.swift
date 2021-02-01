//
//  PhotoViewModel.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import Foundation

class PhotoViewModel: NSObject {
    
    private var apiService : APIService!
    
    init(apiService: APIService = APIService()){
        self.apiService = apiService
    }
    
    private(set) var baseResult : BaseResult! {
        didSet {
            if self.bindCountryViewModelToController != nil{
                self.bindCountryViewModelToController!(self.baseResult)
            }
        }
    }
    
    private(set) var error : Error! {
        didSet {
            if self.bindErrorToController != nil{
                self.bindErrorToController!(error)
            }
        }
    }
    
    var bindCountryViewModelToController : ((BaseResult) -> ())?
    var bindErrorToController : ((Error?) -> ())?
    
    func getData(roverType: String!, page: Int) {
        self.apiService.getPhotos(roverType: roverType, page: page) { (response) in
            if response.error == nil{
                self.baseResult = response.value
            }else{
                self.error = response.error
            }
        }
    }
}
