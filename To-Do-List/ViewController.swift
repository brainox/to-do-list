//
//  ViewController.swift
//  To-Do-List
//
//  Created by Decagon on 18/05/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var tasks: [String] = ["item 1", "item 2", "item 3"]

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        self.title = "To-Do"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNote() {
        let name: String = "Item\(tasks.count + 1)"
        tasks.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK:-Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    //Mark:
}

