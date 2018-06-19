//
//  DrawerPresenterProtocol.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation
protocol DrawerPresenterProtocol {
    func logout()
    func logoutSuccess(page:String) ->Void
    func logoutFailure(message:String) -> Void
    func getAvatar()
    func failedToGetAvatar()
    func successGettingAvatar()
}
