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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    //var itens: [String] = ["molho de tomate", "queijo", "molho apimentado", "manjericao"]
    
    var itens: [Item] = [Item(nome: "molho de tomate", calorias: 40.0),
                         Item(nome: "queijo", calorias: 40.0),
                         Item(nome: "molho apimentado", calorias: 40.0),
                         Item(nome: "manjericao", calorias: 40.0)]
    
    var itensSelecionados: [Item] = []
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
        }
        
        
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func adicionar(){
        if let nome: String = nomeTextField?.text, let felicidade: String = felicidadeTextField?.text {
            if let felicidade = Int(felicidade) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados)
                
                
                
                delegate?.add(refeicao)
                
                // funcao para fechar a tela
                navigationController?.popViewController(animated: true)
            } else {
                print("erro ao tentar criar refeicao")
            }
        }
    }

}

