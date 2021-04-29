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
        let storyBoard = UIStoryboard(name: "SerialImageDownload", bundle: nil)
        guard let myView = storyBoard.instantiateViewController(identifier: "SerialImageDownloadView") as? SerialImageDownloadVC else { return }
        self.navigationController?.pushViewController(myView, animated: true)
    }
    
    @IBAction func openScreenExerciseTwo(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "SimultaneousImageDownload", bundle: nil)
        guard let homeView = storyBoard.instantiateViewController(identifier: "SimultaneousImageDownloadView") as? SimultaneousImageDownloadVC else { return }
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    
    @IBAction func openScreenExerciseThree(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "ReadJSON", bundle: nil)
        guard let readJSONView = storyBoard.instantiateViewController(identifier: "ReadJSON") as? ReadJSONViewController else { return }
        self.navigationController?.pushViewController(readJSONView, animated: true)
    }
}
