//
//  ViewController.swift
//  GasolinaOuAlcool-ios
//
//  Created by Luiz Rodrigo Schuitek on 17/07/19.
//  Copyright © 2019 Luiz Rodrigo Schuitek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var precoAlcoolTextField: UITextField!
    @IBOutlet weak var precoGasolinaTextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcularCombustivelButton(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolTextField.text {
            if let precoGasolina = precoGasolinaTextField.text {
                let resultado  = self.validarCampos(precoAlcool, precoGasolina)
                
                if resultado {
                    if self.calcularMelhorPreco(precoAlcool, precoGasolina) {
                        resultadoLabel.text = "Melhor Preço é o Gasolina!"
                    } else {
                        resultadoLabel.text = "Melhor Preço é o Alcool!"
                    }
                } else {
                    resultadoLabel.text = "Digite os preços para calcular"
                }
            }
        }
    }
    
    func calcularMelhorPreco(_ precoAlcool: String, _ precoGasolina:String) -> Bool {
        
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                let resultadoPreco = valorAlcool / valorGasolina
                 return resultadoPreco >= 0.7
            }
        }
        
        return false
    }
    
    func validarCampos(_ precoAlcool: String, _ precoGasolina:String) -> Bool {
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
}

