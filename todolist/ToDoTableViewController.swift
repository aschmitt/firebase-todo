//
//  ToDoTableViewController.swift
//  todolist
//
//  Created by Andreas Schmitt on 09.09.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ToDoTableViewController: UITableViewController {
    
    var toDoItems:[String] = []
    
    fileprivate func getTodoListItems() {
        
        let refTodoItems = Database.database().reference().child("todos")
        
        refTodoItems.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.toDoItems.removeAll()
                
                //iterating through all the values
                for todo in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let toDoArray = todo.value as? [String: Any]
                    let toDoValue = toDoArray?["todoItem"] as? String
                    
                    //creating artist object with model and fetched values
                    //let artist = ArtistModel(id: artistId as! String?, name: artistName as! String?, genre: artistGenre as! String?)
                    
                    //appending it to list
                    if let toDoItemValue = toDoValue {
                        self.toDoItems.append(toDoItemValue)
                    }
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = false
        
        getTodoListItems()
    }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        let toDoItem = toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItem
        cell.detailTextLabel?.text = ""
        cell.imageView?.image = UIImage(named: toDoItem)
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Open ToDo's"
    }
}
