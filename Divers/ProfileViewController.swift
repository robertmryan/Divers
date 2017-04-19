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
        let text: String
        var value: Float
        var selected: Bool
    }
    
    var arrayOfCellData = [CellData]()
    
    @IBOutlet weak var profilTableView: UITableView!
    
    var refresherControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering the Nib File
        profilTableView.register(UINib(nibName: "DiveNewsShort", bundle: nil), forCellReuseIdentifier: "DiveNewsShort")
        
        // Generating dummy content
        arrayOfCellData = [CellData(text: "Foo", value: 0.5, selected: true), CellData(text : "Hi", value: 0.5, selected: true)]
        
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
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            
            for i in 1 ... 100 {
                self.arrayOfCellData.append(CellData(text: formatter.string(from: NSNumber(value: i))!, value: 0.5, selected: true))
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
        cell.delegate = self
        
        let cellData = arrayOfCellData[indexPath.row]
        cell.newsLabel.text = cellData.text
        cell.newsSwitch.setOn(cellData.selected, animated: false)
        cell.newsSlider.setValue(cellData.value, animated: false)
        
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

extension ProfileViewController: DiveNewsShortDelegate {
    
    func didChangeSwitchValue(for cell: DiveNewsShort, newsSwitch: UISwitch) {
        guard let indexPath = profilTableView.indexPath(for: cell) else { return }
        
        arrayOfCellData[indexPath.row].selected = newsSwitch.isOn
    }
    
    func didChangeSliderValue(for cell: DiveNewsShort, newsSlider: UISlider) {
        guard let indexPath = profilTableView.indexPath(for: cell) else { return }
        
        arrayOfCellData[indexPath.row].value = newsSlider.value
    }

}
