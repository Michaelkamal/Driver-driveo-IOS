//
//  NavigationDrawerModel.swift.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation
import Alamofire

class NavigationDrawerModel:DrawerModelProtocol {
    
    var dPP:DrawerPresenterProtocol
    
    init(withPresenter p:DrawerPresenterProtocol) {
        dPP = p
    }
    
    func getImage() {
        
    }
    
    func getImageSuccess() {
        
    }
    
    func getImageFailure() {
        
    }
    
    func sendRequest() {
        let networkObj:NetworkDAL = NetworkDAL.sharedInstance()
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "auth_token")
        let header = ["Authorization":token]
        networkObj.processPostReq(withBaseUrl: ApiBaseUrl.mainApi, andUrlSuffix: SuffixUrl.logout.rawValue, onSuccess: onSuccess, onFailure: onFailure,headers: header as! HTTPHeaders)
        
        
        
    }
    
    func onSuccess(_ response: Data) {
        
        do{
            let response = try JSONDecoder().decode(SuccessResult.self, from: response)
            if  let result = response.message {
                if result == MsgResponse.success.rawValue{
                    
                    let defaults = UserDefaults.standard
                    dPP.logoutSuccess(page: "login")
                    defaults.removeObject(forKey: "auth_token")
                    defaults.synchronize()
                }else{
                    dPP.logoutSuccess(page: "login")
                }
            }
            else{
                dPP.logoutFailure(message: "Connection error")
            }
        }
        catch {
            print("catch")
            print(ErrorType.parse.rawValue)
            dPP.logoutFailure(message: "Connection error")
        }
    }
    
    func onFailure(_ networkError: ErrorType) {
        
    }
    
    
}
