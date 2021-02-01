//
//  BaseNavigationController.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}
