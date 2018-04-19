//
//  ViewController.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/16/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func logginButtonWasToucheUpInside(sender: Any) {
    let username = usernameTextField.text
    let password = passwordTextField.text
    let success = User.login(userName: username!, password: password!)
    if success {
      performSegue(withIdentifier: "ShowItemList", sender: self)
    }
  }
}

