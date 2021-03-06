//
//  Alerta.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 11/05/22.
//

import Foundation
import UIKit


class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Desculpe", mensagem: String = "Nao foi possivel atualizar a tabela"){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
    
}
