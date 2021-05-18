//
//  ViewController.swift
//  To-Do-List
//
//  Created by Decagon on 18/05/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks:[String] = []
    var selectedRow:Int = -1
    var newRowText:String = ""
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        self.title = "To-Do"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedRow == -1 {
            return
        }
        tasks[selectedRow] = newRowText
        if newRowText == "" {
            tasks.remove(at: selectedRow)
        }
        table.reloadData()
        save()
    }
    
    //MARK:- Adding tasks to the table
    @objc func addNote() {
        if table.isEditing{
            return
        }
        let name: String = ""
        tasks.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detail", sender: nil)
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
    
    //MARK:-TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView:DetailViewController = segue.destination as! DetailViewController
        selectedRow = table.indexPathForSelectedRow!.row
        detailView.masterView = self
        detailView.setText(_text: tasks[selectedRow])
    }
    
    //MARK:-Setting Editing
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)
    }
    //MARK:-Deleting a task from the table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    //MARK:- Saving to UserDefaults
    func  save() {
        UserDefaults.standard.setValue(tasks, forKey: "todo")
    }
    
    //MARK:- Loading the saved data from the UserDefaults
    func load() {
        if let loadedTask: [String] = UserDefaults.standard.value(forKey: "todo") as? [String] {
            tasks = loadedTask
            table.reloadData()
        }
    }
    
    
}

