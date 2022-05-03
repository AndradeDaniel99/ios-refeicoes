//
//  ViewController.swift
//  firstStoryboard
//
//  Created by Daniel de Andrade Souza on 26/04/22.
//

import UIKit


//  Encapsulamento: esse protocolo declara a funcao que vai ser
//  implementada em RefeicoesTableViewController, dessa forma, essa classe
//  apenas acessa o metodo add e nao tudo da outra classe.

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController {
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: - IBActions
    
    @IBAction func adicionar(){
        if let nome: String = nomeTextField?.text, let felicidade: String = felicidadeTextField?.text {
            if let felicidade = Int(felicidade) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                delegate?.add(refeicao)
                navigationController?.popViewController(animated: true)
            } else {
                print("erro ao tentar criar refeicao")
            }
        }
    }

}

