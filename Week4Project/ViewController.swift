//
//  ViewController.swift
//  Week4Project
//
//  Created by Rania Arbash on 2022-02-03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

{
    
    
    @IBOutlet weak var password_text: UITextField!
    
    var manager : StudentLogInManager?
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTable: UITableView!
    var friendsNames : [String] = [String]()
    @IBOutlet weak var text_outlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        password_text.textContentType = .password
        friendsNames = ["Mary","Jone"]
        if let m = (UIApplication.shared.delegate as! AppDelegate).manager{
                manager = m
        }
    }

    @IBAction func button_clicked(_ sender: Any) {
       // optinal binding
        if let correctName = text_outlet.text{
            if let correctPassword = password_text.text {
                manager?.addNewStudent(name: correctName, password: correctPassword)
                myTable.reloadData()
                // refresh the table
                // recall all protocole functions
                text_outlet.text = ""
                password_text.text = ""
            }
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (manager?.allStudents.count)!
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1000 cell in a table
        
        // let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = manager?.allStudents[indexPath.row].name
        cell?.detailTextLabel?.text = manager?.allStudents[indexPath.row].password
        return cell!
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let name = manager?.allStudents[indexPath.row].name{
        
            myLabel.text = "Welcome  \(name)"
        }
        
    }

}

