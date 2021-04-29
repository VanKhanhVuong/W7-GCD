//
//  ReadJSONViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import UIKit

class ReadJSONViewController: UIViewController {
    @IBOutlet weak var studentTableView: UITableView!
    let identifier = "StudentTableViewCell"
    var viewModel = ReadJSONViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        let nib = UINib(nibName: identifier, bundle: nil)
        studentTableView.register(nib, forCellReuseIdentifier: identifier)
        studentTableView.dataSource = self
        viewModel.delegate = self
        viewModel.getDataFromApi()
    }
}

extension ReadJSONViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? StudentTableViewCell else { return UITableViewCell() }
        let item = viewModel.arrayStudent[indexPath.row]
        cell.configure(item: item)
        if item.avatar == nil {
            cell.studentImageView.image = #imageLiteral(resourceName: "empty")
        } else {
            guard let avartar = item.avatar else { return UITableViewCell() }
            cell.showAvatar(urlItem: avartar )
        }
        return cell
    }
   
}
extension ReadJSONViewController: ReadJSONViewModelEvents {
    func gotData() {
        DispatchQueue.main.async {
            self.studentTableView.reloadData()
        }
    }
    
    func gotError(message: String) {
        print(message)
    }
}
