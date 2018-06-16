//
//  DialogueWindow.swift
//  Driveo Driver
//
//  Created by Admin on 6/16/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import Foundation
import UIKit

class DialogueWindow: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect{
        get{
            guard let theView = containerView
                else { return CGRect.zero }
            let factor = 414 / UIScreen.main.bounds.width
            let value = 13/factor
            return CGRect(x: value, y: 85, width: theView.bounds.width-value*2, height: theView.bounds.height-100)
        }
        
    }
}
