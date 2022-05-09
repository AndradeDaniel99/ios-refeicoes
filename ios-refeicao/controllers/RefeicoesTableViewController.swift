//
//  RefeicoesTableViewController.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 02/05/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
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
        
        // essa parte do codigo popula as celulas com elementos do array refeicoes[]
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        // essa parte do codigo utiliza gestures para disparar um metodo
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    // metodo chamado ao apertar o botao adicionar na viewcontroller
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    // metodo chamado ao realizar longpress nas celulas da refeicoestableview
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        
        // checagem necessaria para realizar o metodo somente no comeco do gesto
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            print(refeicao.nome)
            
        }
        
    }
    
    
    //segue é a seta criada pelo storyboard que aponta pra outra tela
    //prepare for segue é a funcao que prepara a proxima tela apontada pelo segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //é uma boa pratica criar um identifier para todos os segues
        //pois um app pode ter varias telas e se nao tiver identificacao
        //nos segues o mesmo metodo vai ser chamado sempre, desperdicando memoria
        
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
}
