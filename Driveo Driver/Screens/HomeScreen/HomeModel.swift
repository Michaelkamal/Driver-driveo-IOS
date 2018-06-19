//
//  HomeModel.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation
import Alamofire

class HomeModel: HomeModelProtocol {
    var hp:HomePresenterProtocol
    
    
    init(withPresenter p:HomePresenterProtocol) {
        hp=p
    }
    
    func sendRequest(parameters: [String : Any]) {
        let networkObj:NetworkDAL = NetworkDAL.sharedInstance()
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey:"auth_token")
        let header = ["Authorization":token]
        print(header)
        networkObj.processPostReq(withBaseUrl: .mainApi, andUrlSuffix: SuffixUrl.updateLocation.rawValue, andParameters: parameters, onSuccess: onSuccess, onFailure: onFailure,headers: header as! HTTPHeaders)
    }
    
    func onSuccess(_ response: Data) {
        
    }
    
    func onFailure(_ networkError: ErrorType) {
        hp.onFailure(message: ErrorType.internet.rawValue)
    }
    
    
}
