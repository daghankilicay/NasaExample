//
//  PhotoCell.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = screen().width * 0.03
    }
    
    func setUI(photo : Photo?){
        self.image.sd_setImage(with: URL(string: photo?.imgSrc ?? "") , completed: { (img, error, SDImageCacheType, URL) in
            
        });
        self.lblFullName.text = photo?.camera.fullName ?? ""
        self.lblDate.text = photo?.earthDate
    }

}
