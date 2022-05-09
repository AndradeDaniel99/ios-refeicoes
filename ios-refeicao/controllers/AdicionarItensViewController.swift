//
//  AdicionarItensViewController.swift
//  ios-refeicao
//
//  Created by Daniel de Andrade Souza on 09/05/22.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
            super.init(nibName: "AdicionarItensViewController", bundle: nil)
            self.delegate = delegate
        }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        // navegar para proxima tela: navigationController.push()
        // navegar para tela anterior: navigationController.pop()
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        guard let caloria = Double(calorias) else { return }
        
        let item = Item(nome: nome, calorias: caloria)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    
}
