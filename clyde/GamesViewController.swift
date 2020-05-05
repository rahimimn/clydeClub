//
//  GameViewController.swift
//  clyde
//
//  Created by Rahimi, Meena Nichole (Student) on 7/11/19.
//  Copyright © 2019 Salesforce. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    
    //----------------------------------------------------------
    // MARK: Outlets
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    
    //----------------------------------------------------------
    // MARK: View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuBar(menuBarItem: menuBarButton)
        self.addLogoToNav()
        // Do any additional setup after loading the view.
    }
    
    
    /// Determines whether the page can autorotate
    override open var shouldAutorotate: Bool {
        return false
    }
    
    
    /// Determines the supported orientations
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    

   

}
