//
//  ValutaViewController.swift
//  CurConverter
//
//  Created by Таня on 07.09.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//
import UIKit

protocol ParserXML: AnyObject {
    func valuteWasSelected(valute: Valute)
}

class ValutaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public weak var delegate: ParserXML?
    @IBOutlet weak var tableView: UITableView!
    
    
    var valuteArray:[Valute] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valuteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let valute = valuteArray[indexPath.row]
        
        //        cell.lLable.text = valute.Name
        //        cell.rLable.text = valute.CharCode
        cell.textLabel?.text = valute.CharCode
        
        cell.detailTextLabel?.text = valute.Name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valute = valuteArray[indexPath.row]
        self.navigationController?.popViewController(animated: true)
        self.delegate?.valuteWasSelected(valute: valute)
    }
}





