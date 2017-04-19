//
//  DiveNewsShort.swift
//  Divers
//
//  Created by Florian on 14.04.17.
//  Copyright © 2017 Florian Ernst. All rights reserved.
//

import UIKit

protocol DiveNewsShortDelegate: class {
    
    func didChangeSwitchValue(for cell: DiveNewsShort, newsSwitch: UISwitch)
    func didChangeSliderValue(for cell: DiveNewsShort, newsSlider: UISlider)

}

class DiveNewsShort: UITableViewCell {

    weak var delegate: DiveNewsShortDelegate?
    
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsSlider: UISlider!
    @IBOutlet weak var newsSwitch: UISwitch!
    
    @IBAction func didChangeSwitchValue(_ sender: UISwitch) {
        delegate?.didChangeSwitchValue(for: self, newsSwitch: sender)
    }
    
    @IBAction func didChangeSliderValue(_ sender: UISlider) {
        delegate?.didChangeSliderValue(for: self, newsSlider: sender)
    }
    
}

