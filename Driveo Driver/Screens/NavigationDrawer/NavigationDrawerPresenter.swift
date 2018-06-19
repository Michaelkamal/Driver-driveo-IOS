//
//  NavigationDrawerPresenter.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation
class NavigationDrawerPresenter : DrawerPresenterProtocol{
    var dVP:DrawerViewProtocol
    var dMP:DrawerModelProtocol!
    
    init(withController c:DrawerViewProtocol) {
        dVP = c
    }
    
    func getAvatar() {
        
    }
    
    func failedToGetAvatar() {
        
    }
    
    func successGettingAvatar() {
        
    }
    
    func logout() {
        dMP = NavigationDrawerModel(withPresenter: self)
        dMP.sendRequest()
    }
    
    func logoutSuccess(page: String) {
        dVP.dismissLoading()
        dVP.goToScreen(withScreenName: page)
    }
    
    func logoutFailure(message: String) {
        
    }
    
    
}
