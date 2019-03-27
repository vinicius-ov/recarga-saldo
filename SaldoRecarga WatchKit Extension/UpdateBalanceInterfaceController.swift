//
//  UpdateBalanceInterfaceController.swift
//  SaldoRecarga WatchKit Extension
//
//  Created by Vinicius Valvassori on 26/03/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import WatchKit
import Foundation


class UpdateBalanceInterfaceController: WKInterfaceController {

    @IBOutlet weak var clearBalanceButton: WKInterfaceButton!
    @IBOutlet weak var balanceLabel: WKInterfaceLabel!
    @IBOutlet weak var operationLabel: WKInterfaceLabel!
    
    var balance = 0.0
    var tariff = 0.0
    var operation:String!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        operation = "\(context!)"
        var operationTitle = "tarifa"
        if operation == "balance"{
            operationTitle = "saldo"
        }
        operationLabel.setText("Atualizar \(operationTitle)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func updateBalance(factor:Double){
        balance = balance * 10.0
        balance = balance + factor
        balanceLabel.setText(String(format: "%.2f", balance))
    }
    
    @IBAction func one() {
        updateBalance(factor: 1.0/100.0)
    }
    @IBAction func two() {
        updateBalance(factor: 2.0/100.0)
    }
    @IBAction func three() {
        updateBalance(factor: 3.0/100.0)
    }
    @IBAction func four() {
        updateBalance(factor: 4.0/100.0)
    }
    @IBAction func five() {
        updateBalance(factor: 5.0/100.0)
    }
    @IBAction func six() {
        updateBalance(factor: 6.0/100.0)
    }
    @IBAction func seven() {
        updateBalance(factor: 7.0/100.0)
    }
    @IBAction func eight() {
        updateBalance(factor: 8.0/100.0)
    }
    @IBAction func nine() {
        updateBalance(factor: 9.0/100.0)
    }
    @IBAction func zero() {
        balance = balance * 10.0
        balanceLabel.setText(String(format: "%.2f", balance))
    }
    @IBAction func confirm() {
        UserDefaults.standard.set(balance, forKey: operation)
        pop()
    }
    
}
