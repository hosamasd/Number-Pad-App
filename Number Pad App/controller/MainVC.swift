//
//  MainVC.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    let digitalAraay = ["1","2","3","4","5","6","7","8","9"]
    let letterAraay = ["","ABC","DEF","GHI","JKL","MNOP","QRS","TUV","WXYZ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PadCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return digitalAraay.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PadCell
        let digital = digitalAraay[indexPath.row]
         let letter = letterAraay[indexPath.row]
        
        cell.digitalLabel.text = digital
        cell.letterLabel.text = letter
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftRightPadd = view.frame.width * 0.15
        let interSpacing = view.frame.width * 0.1
        
        let cellWidth = (view.frame.width - 2 * leftRightPadd - 2 * interSpacing) / 3
        
        return .init(width: cellWidth, height: cellWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightPadd = view.frame.width * 0.15
        let interSpacing = view.frame.width * 0.1
        
        
        return .init(top: 16, left: leftRightPadd, bottom: 16, right: leftRightPadd)
    }
    
}
