//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var inputCardView: UIView!
    
    
    @IBOutlet weak var outputCardView: UIView!
    
    
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    func setUpViews() {
        //headerView
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        
        //inputCard
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        
        //outputcard
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
        
        //resetButton
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    func setTheme(isDark: Bool) {
        
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
       calculate()
        
        
    }
    
    
    
    
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        if themeSwitch.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
        
    }
    
    @IBAction func tipChanged(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    
    func calculate() {
        // dismiss keyboard
        billAmountTextField.calculateButtonAction =  {
            if self.billAmountTextField.isFirstResponder {
                self.billAmountTextField.resignFirstResponder()
            }
            
            guard let billAmountText = self.billAmountTextField.text,
                let billAmount = Double(billAmountText) else {
                    self.reset()
                    return
            }
            
            let tipPercent: Double
            switch self.tipPercentSegmentedControl.selectedSegmentIndex {
            case 0:
                tipPercent = 0.15
            case 1:
                tipPercent = 0.18
            case 2:
                tipPercent = 0.20
            default:
                return
            }
            
            
            let roundedBillAmount = (100 * billAmount).rounded() / 100
            let tipAmount = roundedBillAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            
            
            let totalAmount = roundedTipAmount + roundedBillAmount
            
            // update the ui
            self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
            self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
        }
        
    }
    func reset() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        totalAmountLabel.text = "$0.00"
        tipAmountLabel.text = "$0.00"
    }
    
}

