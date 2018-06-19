//
//  NavigationDrawer.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit

class NavigationDrawer: UIViewController,DrawerViewProtocol {
    
    var dPP: DrawerPresenterProtocol!
    
    var spinner:UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dPP = NavigationDrawerPresenter(withController: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLoading() {
        spinner = UIViewController.displaySpinner(onView: self.view)
    }
    
    func dismissLoading() {
        UIViewController.removeSpinner(spinner: spinner!)
    }
    
    func onFailure(message: String) {
        if message == "Failed to logout" {
            showAlert(withTitle: "Failed", andMessage: message)
        }
        else if message == "no Image"{
            
        }
        
    }
    
    func goToScreen(withScreenName name: String) {
        if name == "login"{
            let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
            let loginPage:LoginViewController = loginStoryboard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
            UIApplication.shared.keyWindow?.rootViewController = loginPage
        }
    }
    
    func showAlert(withTitle title :String , andMessage msg:String){
        var alert:UIAlertController = UIViewController.getCustomAlertController(ofErrorType: msg, withTitle: title)
        self.present(alert, animated: true, completion: nil)
        let dismissAlertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(dismissAlertAction)
    }

    
    
    
    @IBAction func closeView(_ sender: UIButton) {
        self.dismissFromDrawer()
    }
    @IBAction func goToHomePage(_ sender: UIButton) {
        self.dismissFromDrawer()
    }
    @IBAction func myHistory(_ sender: UIButton) {
    }
    @IBAction func aboutUs(_ sender: UIButton) {
    }
    @IBAction func termsOfUse(_ sender: UIButton) {
    }
    @IBAction func logout(_ sender: UIButton) {
        dPP.logout()
        showLoading()
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
