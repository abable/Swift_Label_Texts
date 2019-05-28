//
//  PlainTextViewController.swift
//  Label
//
//  Created by Seungjun Lim on 28/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class PlainTextViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var fontSizeStepper: UIStepper!
    
    
    @IBAction func changeColorToRed(_ sender: Any) {
        valueLabel.textColor = UIColor.red
    }
    
    @IBAction func changeColorToBlue(_ sender: Any) {
        valueLabel.textColor = UIColor.blue
    }
    
    @IBAction func changeColorToBlack(_ sender: Any) {
        valueLabel.textColor = UIColor.black
    }
    
    @IBAction func updateAlignment(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        guard let alignment = NSTextAlignment(rawValue: selectedIndex) else {
            return
        }
        
        valueLabel.textAlignment = alignment
    }
    
    @IBAction func updateFontSize(_ sender: UIStepper) {
        let newSize = CGFloat(sender.value)
        
        let newFont = valueLabel.font.withSize(newSize)
        valueLabel.font = newFont
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
