//
//  HomeModelProtocol.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation

protocol HomeModelProtocol {
    func sendRequest(parameters:[String:Any]);
    func onSuccess(_ response:Data) -> Void
    func onFailure(_ networkError:ErrorType) -> Void
}
