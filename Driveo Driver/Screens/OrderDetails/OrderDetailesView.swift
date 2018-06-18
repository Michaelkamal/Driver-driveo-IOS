//
//  OrderDetailesView.swift
//  Driveo Driver
//
//  Created by Admin on 6/11/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit

class OrderDetailesView: UIViewController {

    var scrollFlag = false;
    
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
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollFlag = false

        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension OrderDetailesView : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        
        let orderImage = cell.viewWithTag(1) as! UIImageView
        
        orderImage.image = UIImage.init(named: "ic_splash")
        
        return cell
        
    }
    
}

//extension OrderDetailesView:UIGestureRecognizerDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
//    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        print("called")
//        return true
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("beyscroll")
//        if (scrollView.contentOffset.y <= -50) {
//            print("scrolled to top")
//            if scrollFlag == true{
//                print("hnnzel")
//                self.dismiss(animated: true, completion: nil)
//            }
//            else{
//                scrollFlag = true
//            }
//        }
//    }
//}






