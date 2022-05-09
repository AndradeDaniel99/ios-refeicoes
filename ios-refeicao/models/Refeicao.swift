//
//  Refeicao.swift
//  firstStoryboard
//
//  Created by Daniel de Andrade Souza on 26/04/22.
//

import UIKit

class Refeicao: NSObject {

    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []

    // setar um valor default para um parametro no inicializador faz com que
    // seja criado um outro inicializador que nao tem como parametro
    // o parametro que tem valor default
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }

    func totalDeCalorias() -> Double {
        var total = 0.0

        for item in itens {
            total += item.calorias
        }

        return total
    }
}
