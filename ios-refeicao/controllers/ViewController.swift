//
//  ViewController.swift
//  firstStoryboard
//
//  Created by Daniel de Andrade Souza on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var nomeTextField: UITextField?
    
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    @IBAction func adicionar(){
        if let nome: String = nomeTextField?.text, let felicidade: String = felicidadeTextField?.text {
            if let felicidade = Int(felicidade) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            } else {
                print("erro ao tentar criar refeicao")
            }
        }
        
    }

}

