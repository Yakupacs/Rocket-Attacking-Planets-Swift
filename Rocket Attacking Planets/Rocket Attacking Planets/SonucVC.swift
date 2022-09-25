//
//  SonucVC.swift
//  Rocket Attacking Planets
//
//  Created by Yakup Acis on 9/25/22.
//

import UIKit

class SonucVC: UIViewController {

    @IBOutlet weak var anlikSonucLabel: UILabel!
    @IBOutlet weak var yuksekSonucLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func tekrarOyna(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
