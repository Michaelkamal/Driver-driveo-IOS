//
//  NavigationDrawer.swift
//  Driveo Driver
//
//  Created by Admin on 6/19/18.
//  Copyright © 2018 Ibtkar. All rights reserved.
//

import UIKit

class NavigationDrawer: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
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
    }
    
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
