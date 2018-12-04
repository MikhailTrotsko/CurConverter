//
//  CurConvertViewController.swift
//  CurConverter
//
//  Created by Таня on 22.08.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit

class CurConvertViewController: UIViewController, ParserXML {
    
    @IBOutlet weak var lValute: UILabel!
    @IBOutlet weak var rValute: UILabel!
    @IBOutlet weak var leftTextFiled: UITextField!
    @IBOutlet weak var rightTextFiled: UITextField!
    
    
    var leftButtonWasTapped = false
    var leftValute: Valute?
    var rightValute: Valute?
    
    @IBAction func rightText(_ sender: UITextField) {
        
        let value = Double(sender.text!)
        if Double(sender.text!) != nil {
        leftTextFiled.text = String(value! * (leftValute?.Value)!)
            
     }
        
}
    @IBAction func leftText(_ sender: UITextField) {
     
        let value = Double(sender.text!)
        if Double(sender.text!) != nil {
        rightTextFiled.text = String(value! * (rightValute?.Value)!)
            
    }
    
}
    @IBAction func leftButton(_ sender: UIButton) {
        leftButtonWasTapped = true
        
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        leftButtonWasTapped = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.destination is ValutaViewController)
        {
            let viewController = segue.destination as! ValutaViewController
            viewController.delegate = self
        }
    }
    
    override func viewDidLoad(){
                super.viewDidLoad()
      rightTextFiled.isEnabled = false
      leftTextFiled.isEnabled = false
        
    }
    
    // MARK: ViewControllerDelegate
    
    func valuteWasSelected(valute: Valute)
    {
        if leftButtonWasTapped
        {
            lValute.text = valute.CharCode
            leftValute = valute
           
        }
      else
        {
            rValute.text = valute.CharCode
            rightValute = valute
            rightTextFiled.isEnabled = true
            leftTextFiled.isEnabled = true
        }
        
            
    }
}


 



