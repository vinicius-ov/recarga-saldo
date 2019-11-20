//
//  InterfaceController.swift
//  SaldoRecarga WatchKit Extension
//
//  Created by Vinicius Valvassori on 11/03/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var balanceButton: WKInterfaceButton!
    @IBOutlet weak var tariffButton: WKInterfaceButton!
    @IBOutlet weak var cashTariffButton: WKInterfaceButton!
    var firstTimeAlert = true
    let OK_ACTION = WKAlertAction.init(title: "OK", style: .default, handler: {})
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let balance = getBalance()
        balanceButton.setTitle(String(format: "%.2f", balance))
        let tariff = getTariff()
        tariffButton.setTitle(String(format: "%.2f", tariff))
        if !isBalance(balance, higherThanTariff: tariff) && firstTimeAlert == true{
            presentAlertNoFunds()            
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func discountTariff() {
        var balance = getBalance()
        let tariff = getTariff()
        if isBalance(balance, higherThanTariff: tariff) {
            balance = balance - tariff
            UserDefaults.standard.set(balance, forKey: "balance")
            balanceButton.setTitle(String(format: "%.2f", balance))
        }else{
            presentAlertNoFunds()
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        firstTimeAlert = true
        return segueIdentifier
    }
    
    func presentAlertNoFunds(){
        firstTimeAlert = false
        presentAlert(withTitle: "Saldo insuficiente", message: "Recarregue agora para não ficar preso na catraca!", preferredStyle: .actionSheet, actions: [OK_ACTION])
    }
    
    func isBalance(_ balance: Double, higherThanTariff tariff: Double) -> Bool {
        return balance > tariff
    }
    
    func getBalance() -> Double {
        return UserDefaults.standard.double(forKey: "balance")
    }
    
    func getTariff() -> Double{
        return UserDefaults.standard.double(forKey: "tariff")
    }

}
