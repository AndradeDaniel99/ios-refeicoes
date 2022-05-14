//
//  RemoveRefeicaoViewController.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 12/05/22.
//

import Foundation
import UIKit


class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        // criando um modal do tipo UIAlert para mostrar os dados refeicao
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)

        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
