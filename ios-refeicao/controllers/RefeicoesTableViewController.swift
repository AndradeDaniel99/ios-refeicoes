//
//  RefeicoesTableViewController.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 02/05/22.
//

import UIKit


class RefeicoesTableViewController: UITableViewController {
    
    let refeicoes = [Refeicao(nome: "macarrao", felicidade: 3),
                     Refeicao(nome: "pizza", felicidade: 4),
                     Refeicao(nome: "yakissoba", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
}