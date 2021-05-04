//
//  HomeViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit

class SimultaneousImageDownloadVC: UIViewController {
    @IBOutlet weak var imageTableView: UITableView!
    var viewModel = SimultaneousImageDownloadViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        imageTableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier())
        imageTableView.dataSource = self
        imageTableView.delegate = self
    }
}

extension SimultaneousImageDownloadVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayUrlImage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier(), for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        let imageURL = viewModel.arrayUrlImage[indexPath.row]
        cell.configure(urlString: imageURL, index: indexPath.row)
        return cell
    }
}

extension SimultaneousImageDownloadVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

    
