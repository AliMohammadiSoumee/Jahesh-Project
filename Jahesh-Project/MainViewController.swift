//
//  MainViewController.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/7/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate{

    @IBOutlet weak var headerScrollView_height: NSLayoutConstraint!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var hedearScrollView: UIScrollView!
    @IBOutlet weak var headerContentView: UIView!
    @IBOutlet weak var headerPageView: UIPageControl!
    @IBOutlet weak var newProductsCollectionView: UICollectionView!
    @IBOutlet weak var topSellersCollectionView: UICollectionView!
    
    var imagesForHeaderScrollView = ["1", "2", "3", "4", "5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeaderScrollView()
        newProductsCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        topSellersCollectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        headerPageView.currentPage = page
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newProductsCollectionView{
            return 8
        }
        else if collectionView == topSellersCollectionView {
            return 8
        }
        else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if collectionView == newProductsCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductsCellIdent", for: indexPath) as! NewProductsCell
        }
        else if collectionView == topSellersCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellersCellIdent", for: indexPath) as! TopSellersCell
        }
        return cell
    }
    
    
    func setHeaderScrollView(){
        let height = headerScrollView_height.constant
        let width = self.view.bounds.width
        
        var def = headerContentView
        
        for image in imagesForHeaderScrollView {
            let imageView = UIImageView()
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            headerContentView.addSubview(imageView)
            
            let leftConstraint: NSLayoutConstraint
            if def == headerContentView {
                leftConstraint = NSLayoutConstraint(item: imageView
                    , attribute: .left
                    , relatedBy: .equal
                    , toItem: headerContentView
                    , attribute: .left
                    , multiplier: 1
                    , constant: 0)
            }else {
                leftConstraint = NSLayoutConstraint(item: imageView
                    , attribute: .left
                    , relatedBy: .equal
                    , toItem: def
                    , attribute: .right
                    , multiplier: 1
                    , constant: 0)
            }
            
            let widthConstraint = NSLayoutConstraint(item: imageView
                , attribute: .width
                , relatedBy: .equal
                , toItem: nil
                , attribute: .notAnAttribute
                , multiplier: 1
                , constant: width)
            let topConstraint = NSLayoutConstraint(item: imageView
                , attribute: .top
                , relatedBy: .equal
                , toItem: headerContentView
                , attribute: .top
                , multiplier: 1
                , constant: 0)
            let heightConstraint = NSLayoutConstraint(item: imageView
                , attribute: .height
                , relatedBy: .equal
                , toItem: nil
                , attribute: .notAnAttribute
                , multiplier: 1
                , constant: height)
            
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true

            imageView.addConstraint(widthConstraint)
            imageView.addConstraint(heightConstraint)
            headerContentView.addConstraint(leftConstraint)
            headerContentView.addConstraint(topConstraint)
            
            imageView.image = UIImage(named: "\(image)")
            
            def = imageView
        }
    }
    
        
    @IBAction func listOfNewProducts(_ sender: AnyObject) {

    }
    
    @IBAction func listOfTopSellerProducts(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func mainPageButtonAction(_ sender: AnyObject) {
        performSegue(withIdentifier: "ShowCategoryList", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategoryList" {
            let _: CategoryListVC = segue.destination as! CategoryListVC
        }
    }
}
