//
//  ViewController.swift
//  firstStoryboard
//
//  Created by Daniel de Andrade Souza on 26/04/22.
//

import UIKit


//  Encapsulamento: esse protocolo declara a funcao que vai ser
//  implementada em RefeicoesTableViewController, dessa forma, essa classe
//  apenas acessa o metodo add e nao tudo da outra classe.

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    
    var itens: [Item] = [Item(nome: "molho de tomate", calorias: 40.0),
                         Item(nome: "queijo", calorias: 40.0),
                         Item(nome: "molho apimentado", calorias: 40.0),
                         Item(nome: "manjericao", calorias: 40.0)]
    
    var itensSelecionados: [Item] = []
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        
        // UIBarButtonItem esse construtor pede um titulo, um estilo para o botao, a localizacao do metodo,
        // e uma acao a ser realizada quando o botao é selecionado.
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar item", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        guard let diretorio = recuperaDiretorio() else { return }
        do {
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            itens = itensSalvos
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    
    // funcao chamada ao pressionar o BarButton 'Adicionar itens' na viewcontroller,
    // abre a tela de adicionar itens
    @objc func adicionarItem(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    // adiciona um item à tableView de adicionar refeicao e recarrega a tableView
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe()
        }
        
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
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // celula recebe a celula selecionada pelo usuario
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            // assim que o check for marcado, adiciona o item selecionado no array de itens selecionados
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            // remove do array de itens selecionados o item cujo check foi desmarcado
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    func recuperarRefeicaoDoFormulario()-> Refeicao? {
        guard let nome = nomeTextField?.text else {
            
            Alerta.init(controller: self).exibe(mensagem: "erro ao ler campo nome")
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            
            Alerta(controller: self).exibe(mensagem: "erro ao ler campo felicidade")
            return nil
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    
    // MARK: - IBActions
    
    @IBAction func adicionar(){
        
        guard let refeicao = recuperarRefeicaoDoFormulario() else {
            return
        }
        
        delegate?.add(refeicao)
        
        // funcao para fechar a tela
        navigationController?.popViewController(animated: true)
    }

}

