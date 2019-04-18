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
    fileprivate let secondCellId = "secondCellId"
    fileprivate let deleteCellId = "deleteCellId"
    fileprivate let headerId = "headerId"
    let digitalAraay = ["1","2","3","4","5","6","7","8","9","*","0","#"]
    let letterAraay = ["","ABC","DEF","GHI","JKL","MNOP","QRS","TUV","WXYZ","",".",""]
    
    lazy var leftRightPadd = view.frame.width * 0.15
    lazy var interSpacing = view.frame.width * 0.1
    lazy var cellWidth = (view.frame.width - 2 * leftRightPadd - 2 * interSpacing) / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PadCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(SecondPadCell.self, forCellWithReuseIdentifier: secondCellId)
        collectionView.register(DeletePadCell.self, forCellWithReuseIdentifier: deleteCellId)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        header.textLabels.text = displayString
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if indexPath.item == 1  {
                displayString = String(displayString.dropLast())
            }
        }else {
            let num = digitalAraay[indexPath.row]
            displayString += num
        }
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        let height = view.frame.height * 0.2
        return .init(width: view.frame.width, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return digitalAraay.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath) as! SecondPadCell
                
                return secondCell
            }else {
                
                let deleteCell = collectionView.dequeueReusableCell(withReuseIdentifier: deleteCellId, for: indexPath) as! DeletePadCell
                
                return deleteCell
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PadCell
        let digital = digitalAraay[indexPath.row]
        let letter = letterAraay[indexPath.row]
        
        cell.digitalLabel.text = digital
        cell.letterLabel.text = letter
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return .init(width: cellWidth, height: cellWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            let leftPadding = (view.frame.width) / 2 - cellWidth / 2
            
            return .init(top: 0, left: leftPadding, bottom: 0, right: self.leftRightPadd)
        }
        let leftRightPadd = view.frame.width * 0.15
        return .init(top: 16, left: leftRightPadd, bottom: 16, right: leftRightPadd)
    }
    
}
