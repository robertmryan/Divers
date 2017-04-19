//
//  ViewController.swift
//  Divers
//
//  Created by Florian on 14.04.17.
//  Copyright © 2017 Florian Ernst. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    struct CellData {
        var cell : Int!
        var text : String!
    }
    
    var arrayOfCellData = [CellData]()
    
    @IBOutlet weak var profilTableView: UITableView!
    
    var refresherControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering the Nib File
        profilTableView.register(UINib(nibName: "DiveNewsShort", bundle: nil), forCellReuseIdentifier: "DiveNewsShort")
        
        // Generating dummy content
        arrayOfCellData = [CellData(cell : 1, text : ""), CellData(cell : 2, text : "Hi")]
        print("TableViewController aufgerufen")
        
        // adding refresh control, this adds some dummy content for testing
        refresherControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresherControl.addTarget(self, action: #selector(populate), for: .valueChanged)
        profilTableView.addSubview(refresherControl)
    }
    
    
    // populate with dummy content
    func populate() {
        DispatchQueue.main.async {
            
            print("Doing stuff")
            
            for i in 1...10 {
                self.arrayOfCellData.append(CellData(cell : i, text : "Hallo!"))
            }
            
            self.profilTableView.reloadData()
            self.refresherControl.endRefreshing()
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // assigning cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiveNewsShort", for: indexPath) as! DiveNewsShort
        
        cell.newsLabel.text = arrayOfCellData[indexPath.row].text
        
        return cell
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
