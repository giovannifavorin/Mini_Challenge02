//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = self.items![indexPath.row]
        
        cell.textLabel?.text = person.nome
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Perfil]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "teste"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchPerfils() {
        do {
            self.items = try context.fetch(Perfil.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }


}

