//
//  AutheticationViewController.swift
//  RewardzTest
//
//  Created by madhuri alshi on 25/08/23.
//

import Foundation
import UIKit
class AutheticationViewController:UIViewController{
    
    @IBOutlet weak var orderBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        orderBtn.layer.cornerRadius = 10
    }
    
    
}
