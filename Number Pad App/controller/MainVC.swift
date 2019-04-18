//
//  MainVC.swift
//  Number Pad App
//
//  Created by hosam on 4/18/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var displayString = ""
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    let digitalAraay = ["1","2","3","4","5","6","7","8","9","*","0","#"]
    let letterAraay = ["","ABC","DEF","GHI","JKL","MNOP","QRS","TUV","WXYZ","",".",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PadCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        header.textLabels.text = displayString
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let num = digitalAraay[indexPath.row]
        displayString += num
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height = view.frame.height * 0.2
        
        return .init(width: view.frame.width, height: height)
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
