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
        
        //creating artist with the given values
        let toDoItem = [
            "id":key,
            "todoItem": toDoValue.text! as String
        ]
        
        //adding the artist inside the generated unique key
        self.refTodoItems.child(key).setValue(toDoItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refTodoItems = Database.database().reference().child("todos")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
