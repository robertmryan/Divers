//
//  ViewController.swift
//  Divers
//
//  Created by Florian on 14.04.17.
//  Copyright © 2017 Florian Ernst. All rights reserved.
//

import UIKit

var profileViewControllers : ProfileViewController!

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var ProfilTableVieww: UITableView!
    
    var TableViewController : ProfilTableView!
    
    var refresherControl : UIRefreshControl = UIRefreshControl()

      override func viewDidLoad() {
        super.viewDidLoad()
        
        // For later use out of other classes
        profileViewControllers = self
        
        // assigning TableViewController, dataSource and delegate
        TableViewController = ProfilTableView()
        ProfilTableVieww.dataSource = TableViewController
        ProfilTableVieww.delegate = TableViewController
        
        // not 100% sure wether this is neccessary
        TableViewController.viewDidLoad()
        
        // adding refresh control, this adds some dummy content for testing
        ProfilTableVieww.addSubview(refresherControl)
        refresherControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresherControl.addTarget(self, action: #selector(ProfileViewController.populate), for: UIControlEvents.valueChanged)
        ProfilTableVieww.addSubview(refresherControl)
        
    }
    
    
    // populate with dummy content
    func populate() {
        DispatchQueue.main.async {
            
            print("Doing stuff")
            
            for i in 1...10 {
                arrayOfCellData.append(cellData(cell : i, text : "Hallo!"))
            }
            
            self.ProfilTableVieww.reloadData()
            self.refresherControl.endRefreshing()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

