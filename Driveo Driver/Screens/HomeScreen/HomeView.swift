//
//  HomeView.swift
//  Driveo Driver
//
//  Created by Admin on 6/11/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeView: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    private var scrollFlag = false;
    @IBOutlet weak var mapV: GMSMapView!
    
    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet var dragGesture: UIPanGestureRecognizer!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    //    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragGesture.delegate = self
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.backgroundColor = UIColor.clear
        ordersCollectionView.isScrollEnabled = false
     
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.distanceFilter = 10
        locationManager.allowsBackgroundLocationUpdates = true
        //        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        //        placesClient = GMSPlacesClient.shared()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let factor = 414 / UIScreen.main.bounds.width
        let value = 13/factor
        ordersCollectionView.contentInset = UIEdgeInsetsMake(0, value, 0, value)
        collectionViewHeight.constant = 111.66
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedStoryboard = UIStoryboard(name: "OrderDetailes", bundle: nil)
        let detailedView = detailedStoryboard.instantiateViewController(withIdentifier: "OrderDetails") as! OrderDetailesView
        detailedView.modalPresentationStyle = UIModalPresentationStyle.custom
        detailedView.transitioningDelegate = self
        self.present(detailedView, animated: true, completion: nil)
        collectionViewHeight.constant = 0
        
    }

//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        dragGesture.isEnabled = true
//    }
}

extension HomeView:UIGestureRecognizerDelegate,UICollectionViewDelegateFlowLayout{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("called")
        return true
    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//        if indexPath.item == 0 {
//            dragGesture.isEnabled = true
//        }
//    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
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
    
}

extension HomeView: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DialogueWindow(presentedViewController: presented, presenting: presentingViewController)
    }
}

extension HomeView : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        currentLocation = location
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        var img = UIImage.init(named: "ic_myself.png")
        marker.icon = img
        marker.iconView?.frame.size = CGSize(width: 33.0, height: 33.0)
        marker.map = mapV
        
        //        if mapView.isHidden {
        //            mapView.isHidden = false
        //            mapView.camera = camera
        //        } else {
        //            mapView.animate(to: camera)
        //        }
        mapV.animate(to: camera)
        //listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            
            locationManager.requestAlwaysAuthorization()
        //mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
            
            
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
