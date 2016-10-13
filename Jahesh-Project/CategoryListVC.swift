//
//  CategoryListVC.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/14/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit
import RATreeView

class CategoryListVC: UIViewController, RATreeViewDelegate, RATreeViewDataSource {
    
    
    @IBOutlet var mainContentView: UIView!
    @IBOutlet weak var searchView: UIView!
    let categoryList = RATreeView()
    var list = [DataObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryList.delegate = self
        categoryList.dataSource = self
        constrainRATableView()
        loadData(completionHandler: { (theList) in
            self.list = theList
            self.list[0] = DataObject(name: "روشنایی", children: [DataObject(name: "لامپ") , DataObject(name: "پریز"), DataObject(name: "سیم", children: [DataObject(name: "سیم ۲"), DataObject(name: "سیم ۱")])])
            DispatchQueue.main.async {
                self.categoryList.reloadData()
            }
            
        })

    }
    
    
    func constrainRATableView(){
        
        mainContentView.addSubview(categoryList)
        categoryList.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: categoryList
            , attribute: .top
            , relatedBy: .equal
            , toItem: searchView
            , attribute: .bottom
            , multiplier: 1
            , constant: 20)
        let leftConstraint = NSLayoutConstraint(item: categoryList
            , attribute: .left
            , relatedBy: .equal
            , toItem: mainContentView
            , attribute: .left
            , multiplier: 1
            , constant: 10)
        let rightConstraint = NSLayoutConstraint(item: categoryList
            , attribute: .right
            , relatedBy: .equal
            , toItem: mainContentView
            , attribute: .right
            , multiplier: 1
            , constant: -10)
        let bottomConstraint = NSLayoutConstraint(item: categoryList
            , attribute: .bottom
            , relatedBy: .equal
            , toItem: mainContentView
            , attribute: .bottom
            , multiplier: 1
            , constant: 10)
        
        mainContentView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

    func loadData(completionHandler:@escaping ([DataObject])->()) -> ()  {
        var list = [DataObject]()
        let string_url = "http://185.8.173.210/api/category/"
        let url = URL(string: string_url)!
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": "Token d0a13a1adeb4507f122706a7ba66bad4e5613821"]
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, AnyObject>
                    
                    if let count = json["count"] {
                        for i in 0...((count as! Int) - 1) {
                            let name = ((json["results"]![i] as! [String:Any]) ["name"] as! String)
                            let newCell = DataObject(name: name)
                            list.append(newCell)
                        }
                    }
                    //(json?["results"]![0] as! [String:Any]) ["name"] as! String
                    
                    completionHandler(list)
                }
                catch{
                    print("json-error")
                }
            }else {
                print(error.debugDescription)
            }
        }
        task.resume()
    }
    
    
    
    
    //RATreeView data source
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? DataObject {
            return item.children.count
        } else {
            return self.list.count
        }

    }
    
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? DataObject {
            return item.children[index]
        } else {
            return list[index] as AnyObject
        }
    }
    
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        
        let cell = TreeTableViewCell()
        cell.selectionStyle = .none
        let item = item as! DataObject
        let level = treeView.levelForCell(forItem: item)
        cell.setup(withTitle: item.name, level: level)
        
        return cell
    }
    
    
    func treeView(_ treeView: RATreeView, didSelectRowForItem item: Any) {
        let cell = categoryList.cell(forItem: item) as! TreeTableViewCell
        if cell.cellExpand {
            cell.cellExpand = false
            cell.expandImage.transform = CGAffineTransform.identity
        }else {
            cell.cellExpand = true
            cell.expandImage.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        }
        
        
    }
}
