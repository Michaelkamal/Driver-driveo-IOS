//
//  HomePresenter.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var hvc:HomeViewProtocol
    var hm:HomeModelProtocol!
    
    init(withController c:HomeViewProtocol) {
        hvc = c
    }
    func updateLocation(longitude: Float, latitude: Float) {
        hm = HomeModel(withPresenter: self)
        let parameters = ["longitude":longitude
            ,"latitude":latitude]
        hm.sendRequest(parameters: parameters)
        
    }
    
    func onFailure(message: String) {
        hvc.onFailure(message: message)
    }
    
    func onSuccess() {
        
    }
    
    
}
