//
//  Data.swift
//  CurConverter
//
//  Created by Таня on 07.09.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//
import UIKit
import Foundation
//class ValuteNameCell: UITableViewCell {
//
//    @IBOutlet weak var lLable: UILabel!
//    @IBOutlet weak var rLable: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

class ParseXML: NSObject, XMLParserDelegate {
    
    var valuteArray:[Valute] = []
    var eName = ""
    var CharCode = ""
    var Name = ""
    var Value = 0.0
    var parser = XMLParser()
    
    
    
    override init() {
        
        let urlString = URL(string: "https://cbr.ru/scripts/XML_daily.asp")
        parser = XMLParser(contentsOf: urlString!)!
        super.init()
        parser.delegate = self
        
        let success:Bool = self.parser.parse()
        if success {
            print("success")
        } else {
            print("parse failure!")
        }
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        eName = elementName
        if elementName == "Valute" {
            CharCode = ""
            Name = ""
            Value = 0.0
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Valute" {
            
            let valute = Valute()
            
            valute.CharCode = CharCode
            valute.Name = Name
            valute.Value = Value
            
            valuteArray.append(valute)
            print(Value, Name, CharCode)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.count != 0 {
            switch eName{
            case "CharCode": CharCode = data
            case "Name": Name = data
            case "Value":
                let formatter = NumberFormatter()
                formatter.decimalSeparator = ","
                let grade = formatter.number(from: data)
                if let gradeDouble = grade?.doubleValue {
                    Value = gradeDouble
                }
            default:
                break
            }
        }
    }
}


