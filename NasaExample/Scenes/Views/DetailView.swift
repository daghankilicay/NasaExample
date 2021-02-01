//
//  DetailView.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import UIKit

class DetailView: UIView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblPhotoTaken: UILabel!
    @IBOutlet weak var lblVehicleName: UILabel!
    @IBOutlet weak var lblWhichCamera: UILabel!
    @IBOutlet weak var lblMissionStatus: UILabel!
    @IBOutlet weak var lblLaunchDate: UILabel!
    @IBOutlet weak var lblLandingDate: UILabel!
    
    @IBOutlet weak var viewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewCard.layer.cornerRadius = screen().width * 0.03
    }
    
    func setUI(photo:Photo?){
        if photo != nil{
            self.image.sd_setImage(with: URL(string: photo!.imgSrc) , completed: { (img, error, SDImageCacheType, URL) in
                
            });
            self.lblPhotoTaken.text = photo?.earthDate ?? ""
            self.lblVehicleName.text = photo?.rover.name ?? ""
            self.lblWhichCamera.text = photo?.camera.name ?? ""
            self.lblMissionStatus.text = photo?.rover.status?.uppercased() ?? ""
            self.lblLaunchDate.text = photo?.rover.launchDate ?? ""
            self.lblLandingDate.text = photo?.rover.landingDate ?? ""
        }
    }

    @IBAction func clickClose(_ sender: Any) {
        self.removeFromSuperview()
    }
}
