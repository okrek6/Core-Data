//
//  Core_DataViewController.swift
//  Core Data
//
//  Created by Brendan Krekeler on 7/27/18.
//  Copyright © 2018 Brendan Krekeler. All rights reserved.
//

import UIKit

import CoreData

class TasksViewController: UITableViewController {
    
    var tasks: [String] = []
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 239/255, blue: 231/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTasks))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func addTasks(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Add New Item", message: "Please fill in the textfield below", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) { [unowned self] action in guard let textField = alertController.textFields?.first, let taskToAdd = textField.text else { return }
            self.tasks.append(taskToAdd)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        _ = tasks[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

