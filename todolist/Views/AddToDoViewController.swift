//
//  AddToDoViewController.swift
//  todolist
//
//  Created by Andreas Schmitt on 10.09.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddToDoViewController: UIViewController {
    
    var refTodoItems = DatabaseReference()
    
    @IBOutlet weak var toDoValue: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        let key = self.refTodoItems.childByAutoId().key
        
        let toDoItem = [
            "id":key,
            "todoItem": toDoValue.text! as String
        ]
        
        self.refTodoItems.child(key).setValue(toDoItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refTodoItems = Database.database().reference().child("todos")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
