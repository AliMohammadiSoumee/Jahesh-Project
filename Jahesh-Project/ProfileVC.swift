//
//  ProfileVC.swift
//  Jahesh-Project
//
//  Created by Ali Soume`e on 7/22/1395 AP.
//  Copyright © 1395 Ali-Soume. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileGmail: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBackground: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 10
        profileImage.layer.masksToBounds = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func showRecords(_ sender: AnyObject) {
        performSegue(withIdentifier: "ShowRecordes", sender: nil)
    }

    @IBAction func showFavorites(_ sender: AnyObject) {
        print("favorites")
    }

    @IBAction func profileExit(_ sender: AnyObject) {
        print("exit")
    }
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecordes" {
            let recordes: RecordesVC = segue.destination as! RecordesVC
        }
    }
}
