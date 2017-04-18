//
//  TableViewController.swift
//  WebTry
//
//  Created by Florian on 07.04.17.
//  Copyright © 2017 Florian Ernst. All rights reserved.
//

//import Foundation
import UIKit

struct cellData {
    var cell : Int!
    var text : String!
}

var arrayOfCellData = [cellData]()


class ProfilTableView: UITableViewController {
    
    override func viewDidLoad() {
        // Not quite sure wether or not this line is neccessary
        super.viewDidLoad()
        
        // Registering the Nib File
        tableView.register(UINib(nibName: "DiveNewsShort", bundle: nil), forCellReuseIdentifier: "DiveNewsShort")
        
        // Generating dummy content
        arrayOfCellData = [cellData(cell : 1, text : ""), cellData(cell : 2, text : "Hi")]
        print("TableViewController aufgerufen")
      
    }
    
    
   
       public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfCellData.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
   
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
     return 100
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // With this line the app runs kinda correct, but it seems that every 8. cell is the same (check manipulating the slider oder switch, the other ones change too), which is not my intent
        
          tableView.register(UINib(nibName: "DiveNewsShort", bundle: nil), forCellReuseIdentifier: "DiveNewsShort")
        
        // assigning cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiveNewsShort", for: indexPath) as! DiveNewsShort
        
        cell.Label.text = arrayOfCellData[indexPath.row].text
        
        return cell
        
    }
    
    
}
