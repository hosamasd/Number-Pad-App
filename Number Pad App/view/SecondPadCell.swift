//
//  SecondPadCell.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class SecondPadCell: BaseCell {
    
    let callImage:UIImageView = {
       let im = UIImageView(image: #imageLiteral(resourceName: "phone"))
        im.contentMode = .scaleAspectFit
       
        return im
    }()
    
    override func setupViews() {
        backgroundColor = .green
        addSubview(callImage)
        
        callImage.centerInSuperview(size: .init(width: 40, height: 40))
    }
}
