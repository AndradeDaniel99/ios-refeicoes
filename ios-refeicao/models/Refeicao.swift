//
//  Refeicao.swift
//  firstStoryboard
//
//  Created by Daniel de Andrade Souza on 26/04/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {

    // MARK: - atributos

    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    
    // MARK: - init

    // setar um valor default para um parametro no inicializador faz com que
    // seja criado um outro inicializador que nao tem como parametro
    // o parametro que tem valor default
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    
    // MARK: - metodos

    func totalDeCalorias() -> Double {
        var total = 0.0

        for item in itens {
            total += item.calorias
        }

        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)\n"
        
        for item in itens {
            mensagem += "\(item.nome): \(item.calorias) calorias\n"
        }
        return mensagem
    }
    
}
