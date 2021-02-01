//
//  BaseViewController.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    var progress : ProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showAlertMessage(message:String) {

        let alertController = UIAlertController(title: "NASA Example", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showProgress(){
        self.progress = ProgressView.showProgress()
    }
    
    func hideProgress() {
        self.progress?.removeFromSuperview()
    }
    
    func setNavigationLogo(){
        let logo = UIImage(named: Constant.logo)
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }

}
