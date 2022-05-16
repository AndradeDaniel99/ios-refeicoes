//
//  RefeicaoDao.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 16/05/22.
//

import Foundation


class RefeicaoDao {
    
    func save(_ refeicoes: [Refeicao]){
        
        guard let caminho = recuperaCaminho() else { return }
        
        // para utilizar try tem q ser dentro de um do
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            
            try dados.write(to: caminho)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
