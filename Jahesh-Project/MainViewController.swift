//
//  MainViewController.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/7/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var hedearScrollView: UIScrollView!
    @IBOutlet weak var headerPageView: UIPageControl!
    @IBOutlet weak var newProductsCollectionView: UICollectionView!
    @IBOutlet weak var topSellersCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newProductsCollectionView.transform = CGAffineTransformMakeScale(-1, 1)
        topSellersCollectionView.transform = CGAffineTransformMakeScale(-1, 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newProductsCollectionView{
            return 4
        }
        else if collectionView == topSellersCollectionView {
            return 4
        }
        else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if collectionView == newProductsCollectionView {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("NewProductsCellIdent", forIndexPath: indexPath) as! NewProductsCell
        }
        else if collectionView == topSellersCollectionView {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("TopSellersCellIdent", forIndexPath: indexPath) as! TopSellersCell
        }
        cell.transform = CGAffineTransformMakeScale(-1, 1)
        //cell.layer.cornerRadius = 10
        
        return cell
        
    }
}
