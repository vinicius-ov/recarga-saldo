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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
       
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        var balance = UserDefaults.standard.double(forKey: "balance")
        balanceButton.setTitle(String(format: "%.2f", balance))
        var tariff = UserDefaults.standard.double(forKey: "tariff")
        tariffButton.setTitle(String(format: "%.2f", tariff))
        if balance < tariff {
            presentAlert(withTitle: "Saldo insuficiente", message: "Recarregue agora para não ficar preso na catraca!", preferredStyle: .sideBySideButtonsAlert, actions: [])
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func discountTariff() {
        var balance = UserDefaults.standard.double(forKey: "balance")
        var tariff = UserDefaults.standard.double(forKey: "tariff")
        if balance > tariff {
            balance = balance - tariff
            UserDefaults.standard.set(balance, forKey: "balance")
            balanceButton.setTitle(String(format: "%.2f", balance))
        }else{
            presentAlert(withTitle: "Saldo insuficiente", message: "Recarregue agora para não ficar preso na catraca!", preferredStyle: .actionSheet, actions: [])
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return segueIdentifier
    }

}
