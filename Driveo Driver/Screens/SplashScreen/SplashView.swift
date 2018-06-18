//
//  SplashView.swift
//  Driveo
//
//  Created by Admin on 6/7/18.
//  Copyright © 2018 ITI. All rights reserved.
//

import UIKit

class SplashView: UIViewController {

    @IBOutlet weak var splashIcon: UIImageView!
    
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var LoadingSpinner: UIActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        LoadingSpinner.stopAnimating()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.LoadingSpinner.stopAnimating()
            let defaults = UserDefaults.standard
            if defaults.string(forKey: "auth_token") != nil {
                let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                let homeView:HomeView = mainStoryboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
                self.present(homeView, animated: true, completion: nil)
            } else {
                let loginStoryBoard = UIStoryboard.init(name: "Login", bundle: nil)
                let loginPage:LoginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
                self.present(loginPage, animated: true, completion: nil)
            }
           
        })
        
        UIView.animate(withDuration: 2.5, delay: 0.3, options: .allowAnimatedContent, animations: {
            self.appName.center.y -= self.view.bounds.height
        }, completion: {
        finished in
             self.LoadingSpinner.startAnimating()
            
          
        })
        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .allowAnimatedContent, animations: {
            self.splashIcon.center.x += self.view.bounds.width
        }, completion: nil)
        
    }
        
    }

    
 
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


