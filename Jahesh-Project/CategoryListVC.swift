//
//  CategoryListVC.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/14/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit
import RATreeView
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


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
        
        loadMainList(completionHandler: { (theList) in
            self.list = theList
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
            , constant: -50)
        
        mainContentView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }

    
    func loadMainList(completionHandler:@escaping ([DataObject])->()) -> ()  {
        let path = "http://185.8.173.210/api/"
        let qpath = path + "category/"
        let authorization = "token d0a13a1adeb4507f122706a7ba66bad4e5613821"
        let headers = ["Authorization": authorization, "Accept": "application/json"]
        
        Alamofire.request(qpath, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseObject { (response: DataResponse<CategResponse>) in
                switch response.result {
                case .success:
                    print("success")
                    let json = response.result.value!.main!
                    let list = json.map {
                        DataObject(name: $0.name!, id: $0.id!, children: [])
                    }
                    completionHandler(list)
                case .failure:
                        print("error")
                }
        }
    }
    
    
    func loadSubList(id: Int, completionHandler:@escaping ([DataObject])->()) -> ()  {
        let path = "http://185.8.173.210/api/"
        let qpath = path + "category/"
        let authorization = "token d0a13a1adeb4507f122706a7ba66bad4e5613821"
        let headers = ["Authorization": authorization, "Accept": "application/json"]
        let parameter = ["id": id]
        
        Alamofire.request(qpath, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseObject { (response: DataResponse<CategResponse>) in
                switch response.result {
                case .success:
                    let json = response.result.value!.main!
                    let list = json.map {
                        DataObject(name: $0.name!, id: $0.id!, children: [])
                    }
                    completionHandler(list)
                case .failure:
                    print("error")
                }
        }
    }
    
    
    class CategResponse: Mappable {
        var main: [CategR]?
        var count: Int?
        
        required init?(map: Map){
            
        }
        
        func mapping(map: Map) {
            count <- map["count"]
            main <- map["results"]
        }
    }
    
    
    class CategR: Mappable {
        var id: Int?
        var name: String?
        
        required init?(map: Map){
            
        }
        
        func mapping(map: Map) {
            id <- map["id"]
            name <- map["name"]
        }
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
        cell.setup(withTitle: item.name, id: item.id, level: level)
        
        if item.isExpand {
            cell.expandImage.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        }
        
        return cell
    }
    
    
    func treeView(_ treeView: RATreeView, didSelectRowForItem item: Any) {
        let cell = categoryList.cell(forItem: item) as! TreeTableViewCell
        let item = treeView.item(for: cell) as! DataObject
        
        
        if item.isExpand {
            item.isExpand = false
            cell.expandImage.transform = CGAffineTransform.identity
        }
        else {
            item.isExpand = true
            if !(item.haveChildren) {
                loadSubList(id: item.id) { (subList) in
                    for newItem in subList {
                        item.addChild(child: newItem)
                        treeView.insertItems(at: NSIndexSet.init(index: item.children.count-1) as IndexSet, inParent: item, with: RATreeViewRowAnimationNone)
                    }
                    treeView.reloadRows(forItems: [subList], with: RATreeViewRowAnimationNone)
                    item.haveChildren = true
                }
            }
            cell.expandImage.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        }
    }
}
