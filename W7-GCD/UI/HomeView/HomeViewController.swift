//
//  HomeViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 26/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var imageTableView: UITableView!
    let identifier = "MyTableViewCell"
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        let nib = UINib(nibName: identifier, bundle: nil)
        imageTableView.register(nib, forCellReuseIdentifier: identifier)
        imageTableView.dataSource = self
        imageTableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayUrlImage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        let imageURL = viewModel.arrayUrlImage[indexPath.row]
        cell.myImageView.image = #imageLiteral(resourceName: "empty")
        cell.tag = indexPath.row
        DispatchQueue.global(qos: .default).async {
            if let data = try? Data(contentsOf: URL(string: imageURL)!){
                DispatchQueue.main.async {
                    if cell.tag == indexPath.row{
                        cell.myImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

    
