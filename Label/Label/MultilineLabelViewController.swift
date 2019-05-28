//
//  MultilineLabelViewController.swift
//  Label
//
//  Created by Seungjun Lim on 28/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class MultilineLabelViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var lineNumberLabel: UILabel!
    @IBOutlet weak var lineNumberStepper: UIStepper!
    @IBOutlet weak var autoshrinkSwitch: UISwitch!
    @IBOutlet weak var lineBreakModePicker: UIPickerView!
    
    @IBAction func updateLines(_ sender: UIStepper) {
        valueLabel.numberOfLines = Int(sender.value)
        lineNumberLabel.text = "\(valueLabel.numberOfLines)"
    }
    
    @IBAction func toggleAutoshrink(_ sender: UISwitch) {
        valueLabel.minimumScaleFactor = sender.isOn ? 0.5 : 0.0
        // 0.0 과 0.5 가 토글되도록...
        valueLabel.adjustsFontSizeToFitWidth = sender.isOn
        // 두 속성을 함께 변경 하도록 한다.
    }
    
    func changeLineBreakMode(with rawValue: Int) {
        if let mode = NSLineBreakMode(rawValue: rawValue) {
            valueLabel.lineBreakMode = mode
        }
        // 전달된 인덱스로 열겨형 인스턴스를 형성하고 lineBreakMode 에 저장한다.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineNumberLabel.text = "\(valueLabel.numberOfLines)"
        // lineNumber 의 현제 라인수를 출력.
        lineNumberStepper.value = Double(valueLabel.numberOfLines)
        // Stepper 의 value 를 초기화.
        autoshrinkSwitch.isOn = valueLabel.minimumScaleFactor != 0 && valueLabel.adjustsFontSizeToFitWidth
        // autoshrinkSwitch 를 초기화 .. UILabel에 autosharink 속성이 존재하지 않는다 그렇기떄문에 두속성을 조합하여 구현...
        
        lineBreakModePicker.selectRow((valueLabel?.lineBreakMode)!.rawValue, inComponent: 0, animated: false)
        // DataPicker 의 선택위치를  현제 lineBreakMode 값으로 초기화한다.
    }
}


extension MultilineLabelViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
}

extension MultilineLabelViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Word Wrap"
        case 1:
            return "Character Wrap"
        case 2:
            return "Clip"
        case 3:
            return "Truncating Head"
        case 4:
            return "Truncating Tail"
        case 5:
            return "Truncating Middle"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changeLineBreakMode(with: row)
    }
}
