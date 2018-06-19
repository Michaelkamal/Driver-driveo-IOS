//
//  DrawerViewProtocol.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation

protocol DrawerViewProtocol {
    
    func onFailure(message:String)
    func dismissLoading()
    func goToScreen(withScreenName name:String)
    
}
