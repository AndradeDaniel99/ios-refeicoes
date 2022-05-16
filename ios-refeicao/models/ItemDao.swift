//
//  ItemDao.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 16/05/22.
//

import Foundation

class ItemDao {
    
    func save(_ itens: [Item]){
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio()-> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
    
}
