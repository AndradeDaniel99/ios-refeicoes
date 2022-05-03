//
//  RefeicoesTableViewController.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 02/05/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes = [Refeicao(nome: "macarrao", felicidade: 3),
                     Refeicao(nome: "pizza", felicidade: 4),
                     Refeicao(nome: "yakissoba", felicidade: 5)]
    
    
    //toda tableviewcontroller precisa de 2 metodos:
    //um pra falar o numero de colunas da tabela, (numberOfRowsInSection)
    //e outro pra dizer o conteudo das celulas    (cellForRowAt)
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        return celula
    }
    
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    
    //segue é a seta criada pelo storyboard que aponta pra outra tela
    //prepare for segue é a funcao que prepara a proxima tela apontada pelo segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //é uma boa pratica criar um identifier para todos os segues
        //pois um app pode ter varias telas e se nao tiver identificacao
        //nos segues o mesmo metodo vai ser chamado sempre, desperdicando memoria
        
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.refeicoestableViewController = self
            }
        }
    }
    
}
