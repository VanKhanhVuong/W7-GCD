//
//  MainViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openScreenExerciseOne(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "MyView", bundle: nil)
        let myView = storyBoard.instantiateViewController(identifier: "MyView") as! MyViewController
        self.navigationController?.pushViewController(myView, animated: true)
    }
    
    @IBAction func openScreenExerciseTwo(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "HomeView", bundle: nil)
        let myView = storyBoard.instantiateViewController(identifier: "HomeView") as! HomeViewController
        self.navigationController?.pushViewController(myView, animated: true)
    }
}
