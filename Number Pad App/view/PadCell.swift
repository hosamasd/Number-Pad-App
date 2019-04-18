//
//  PadCell.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class PadCell: BaseCell {
    
    let digitalLabel:UILabel = {
        let la = UILabel()
        la.font = UIFont.systemFont(ofSize: 30)
        la.textAlignment = .center
        return la
    }()
    let letterLabel:UILabel = {
        let la = UILabel()
        la.font = UIFont.systemFont(ofSize: 15)
        la.textAlignment = .center
        return la
    }()
    
    override var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? .darkGray : UIColor(white: 0.95, alpha: 1)
            digitalLabel.textColor = isHighlighted ? .white : .black
            letterLabel.textColor = isHighlighted ? .white : .black
        }
    }
    
    
    override func setupViews()  {
        let stacks = UIStackView(arrangedSubviews: [digitalLabel,letterLabel])
        stacks.axis = .vertical
        
        addSubview(stacks)
        stacks.centerInSuperview()
        
    }
}
