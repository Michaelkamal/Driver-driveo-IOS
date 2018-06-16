//
//  HomeView.swift
//  Driveo Driver
//
//  Created by Admin on 6/11/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate,UICollectionViewDelegateFlowLayout {
    
    private var scrollFlag = false;
    
    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet var dragGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragGesture.delegate = self
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.backgroundColor = UIColor.clear
        ordersCollectionView.isScrollEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let factor = 414 / UIScreen.main.bounds.width
        let value = 13/factor
        ordersCollectionView.contentInset = UIEdgeInsetsMake(0, value, 0, value)
    }

    
    @IBAction func menuButton(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ordersCollectionView.register(UINib(nibName: "OrderCell", bundle: nil), forCellWithReuseIdentifier: "summaryCell")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summaryCell", for: indexPath) as! OrderCell
       
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("*-/*/*/*/*/*/*/*-*/*-/*-**-/-*/-*/-*/-")
        let factor = 414 / UIScreen.main.bounds.width
        let subtractionValue = 26/factor
        return CGSize(width: UIScreen.main.bounds.width-subtractionValue, height: 85)
    }
    
    @IBAction func dragFunc(_ sender: UIPanGestureRecognizer) {
        var velocity = sender.velocity(in: ordersCollectionView)
        print(velocity.y)
        if velocity.y > 0{
            collectionViewHeight.constant = 111.66
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
            print("swpe dwn")
            ordersCollectionView.isScrollEnabled = false
        }
        else{
            collectionViewHeight.constant = UIScreen.main.bounds.height - 110
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
            
            ordersCollectionView.isScrollEnabled = true
            dragGesture.isEnabled = false
            print("swpe up")
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("called")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print(indexPath.item)
        if indexPath.item == 0 {
            dragGesture.isEnabled = true
        }
    }
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !decelerate {
//            self.scrollViewDidEndDecelerating(scrollView)
//        }
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if(translation.y > 0)
        {
            
            if ordersCollectionView.cellForItem(at: IndexPath(item: 0, section: 0)) != nil{
                if scrollFlag == true{
                    dragGesture.isEnabled = true
                    print("7asal akbar")
                    collectionViewHeight.constant = 111.66
                    UIView.animate(withDuration: 0.4, animations: {
                    self.view.layoutIfNeeded()
                    })
                }
                else{
                    scrollFlag = true
                }
            }
        } else
        {
            scrollFlag = false
            print("7asal asghaar")
        }
    }

//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        dragGesture.isEnabled = true
//    }
}
