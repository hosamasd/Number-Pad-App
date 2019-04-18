//
//  HeaderCell.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionReusableView {
    
    let textLabels:UILabel = {
       let la = UILabel()
         la.textAlignment = .center
        la.adjustsFontSizeToFitWidth = true
        la.font = UIFont.systemFont(ofSize: 25)
        return la
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(textLabels)
        textLabels.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
