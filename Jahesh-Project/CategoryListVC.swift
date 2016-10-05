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
        buildRATableView()
        list = load_list()
    }

    func load_list() -> [DataObject]{
    
    let phone1 = DataObject(name: "Phone 1")
    let phone2 = DataObject(name: "Phone 2")
    let phone3 = DataObject(name: "Phone 3")
    let phone4 = DataObject(name: "Phone 4")
    let phones = DataObject(name: "Phones", children: [phone1, phone2, phone3, phone4])
    
    let notebook1 = DataObject(name: "Notebook 1")
    let notebook2 = DataObject(name: "Notebook 2")
    
    let computer1 = DataObject(name: "Computer 1", children: [notebook1, notebook2])
    let computer2 = DataObject(name: "Computer 2")
    let computer3 = DataObject(name: "Computer 3")
    let computers = DataObject(name: "Computers", children: [computer1, computer2, computer3])
    
    let cars = DataObject(name: "Cars")
    let bikes = DataObject(name: "Bikes")
    let houses = DataObject(name: "Houses")
    let flats = DataObject(name: "Flats")
    let motorbikes = DataObject(name: "motorbikes")
    let drinks = DataObject(name: "Drinks")
    let food = DataObject(name: "Food")
    let sweets = DataObject(name: "Sweets")
    let watches = DataObject(name: "Watches")
    let walls = DataObject(name: "Walls")
    
    return [phones, computers, cars, bikes, houses, flats, motorbikes, drinks, food, sweets, watches, walls]
    }
    
    
    func buildRATableView(){
        
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

//    func reloadData(){
//        let string_url = "http://185.8.173.210/api/category"
//        let url = URL(string: string_url)!
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let data = data{
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, AnyObject>
//                    print(json)
//                }
//                catch{
//                    print("json-error")
//                }
//            }else {
//                print(error.debugDescription)
//            }
//        }
//        task.resume()
//        
//    }
    
    
    
    
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
        let item = item as! DataObject
        let level = treeView.levelForCell(forItem: item)
        let detailsText = "Number of children \(item.children.count)"
        cell.setup(withTitle: item.name, detailsText: detailsText, level: level)

        return cell
    }
}
