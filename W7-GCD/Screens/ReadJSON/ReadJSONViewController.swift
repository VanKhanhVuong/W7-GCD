//
//  ReadJSONViewController.swift
//  W7-GCD
//
//  Created by Văn Khánh Vương on 28/04/2021.
//

import UIKit

class ReadJSONViewController: UIViewController {
    @IBOutlet weak var optionSwitch: UISwitch!
    @IBOutlet weak var studentTableView: UITableView!
    private var viewModel = ReadJSONViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        studentTableView.register(StudentTableViewCell.nib(), forCellReuseIdentifier: StudentTableViewCell.identifier())
        studentTableView.dataSource = self
        viewModel.delegate = self
        optionSwitch.isOn = true
        viewModel.getDataFromLocal()
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        viewModel.arrayStudent = [] 
        if sender.isOn {
            showAlert(message: "Get data from local")
            viewModel.getDataFromLocal()
        } else {
            showAlert(message: "Get data from Internet")
            viewModel.getDataFromApi()
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Message !!!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ReadJSONViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier(), for: indexPath) as? StudentTableViewCell else { return UITableViewCell() }
        let item = viewModel.arrayStudent[indexPath.row]
        cell.configure(item: item, index: indexPath.row)
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
