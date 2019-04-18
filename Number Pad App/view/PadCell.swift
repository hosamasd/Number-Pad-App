//
//  PadCell.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class PadCell: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        let stacks = UIStackView(arrangedSubviews: [digitalLabel,letterLabel])
        stacks.axis = .vertical
        
        addSubview(stacks)
        stacks.centerInSuperview()
        
    }
}
