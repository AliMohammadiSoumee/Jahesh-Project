//
//  ProductsList.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/22/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class ProductsList: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var width: CGFloat!
    var height: CGFloat!
    
    var command = ""
    var json = Dictionary<String, AnyObject>()
    var titles = [String]()
    var prices = [String]()
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.frame.width
        height = self.view.frame.height
        json = getJson()
        (titles, prices, images) = getDate()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.titleLabel.text = titles[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        let url = URL(string: "\(images[indexPath.row])")!
        let data = NSData.init(contentsOf: url) as! Data
        cell.imageView.image = UIImage(data: data)
        
        return cell
    }
    
    
    func getJson() -> Dictionary<String, AnyObject> {
        let json = Dictionary<String, AnyObject>()
        
        
        
        return json
    }
    
    
    func getDate() -> ([String], [String], [String]) {
        var titles = [String]()
        var prices = [String]()
        var images = [String]()
        
        
        return (titles, prices, images)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
