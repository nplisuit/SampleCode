//
//  CatalogCell.swift
//  SampleCode
//
//  Created by Nguyen Phuc Loc on 11/9/15.
//  Copyright © 2015 locnp. All rights reserved.
//

import UIKit

class CatalogCell: UICollectionViewCell {

    @IBOutlet weak var imgvCatalog: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func renderData(data:NSDictionary){
        let sUrl = data.objectForKey("url_m") as! String
        let urlImage = NSURL(string: sUrl)
        self.imgvCatalog?.sd_setImageWithURL( urlImage, placeholderImage: UIImage(named: "place_holder"))
    }
}
