//
//  OrderDetailesView.swift
//  Driveo Driver
//
//  Created by Admin on 6/11/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit

class OrderDetailesView: UIViewController {

    
    
    @IBOutlet weak var orderNumber: UILabel!

    @IBOutlet weak var orderDate: UILabel!

    @IBOutlet weak var orderTime: UILabel!
    
    @IBOutlet weak var orderId: UILabel!
    
    @IBOutlet weak var orderTitle: UILabel!
    
    
    @IBOutlet weak var orderDescription: UILabel!
    
    
    
    @IBOutlet weak var ordersImageCollection: UICollectionView!
    
    @IBOutlet weak var orderPaymentMethod: UILabel!
    
    @IBOutlet weak var orderPickup: UILabel!
    
    @IBOutlet weak var orderDropOff: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
