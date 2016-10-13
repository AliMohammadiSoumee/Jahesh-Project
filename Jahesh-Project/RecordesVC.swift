//
//  RecordesVC.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/22/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit
import UIColorRGBA

class RecordesVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    @IBOutlet weak var infoTableView: UITableView!
    
    var names = ["روشنایی", "سیم", "پریز", "کابل"]
    var colors = ["#4C2636", "#139684", "#D6AC61", "#FF7D1"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecordeCell = tableView.dequeueReusableCell(withIdentifier: "RecordeCell") as! RecordeCell
        cell.cellName.text = names[indexPath.row]
        cell.cellColor.backgroundColor = UIColor(rgba: colors[indexPath.row])
        return cell
    }
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    
    
    

}
