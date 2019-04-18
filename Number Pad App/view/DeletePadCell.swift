//
//  DeletePadCell.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class DeletePadCell: BaseCell {
    
    let callImage:UIImageView = {
        let im = UIImageView(image: #imageLiteral(resourceName: "phone_backspace"))
        im.contentMode = .scaleAspectFit
        
        return im
    }()
    
    override func setupViews() {
     
        addSubview(callImage)
        
        callImage.centerInSuperview(size: .init(width: 40, height: 40))
    }
}
