//
//  ViewController.swift
//  breakingApp
//
//  Created by Vicente Patricio on 13/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit
import Imaginary

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buscarPersonagens: UISearchBar!
    @IBOutlet weak var tablePersonagens: UITableView! {
        didSet {
            let nibName = UINib(nibName: "CelulaTableViewCell", bundle: nil)
            self.tablePersonagens.register(nibName, forCellReuseIdentifier: "idCell")
        }
    }
    
    var listaPersonagens: [Character] = [] {
        didSet {
            listaComFiltros = listaPersonagens
            tablePersonagens.reloadData()
        }
    }
    var listaMensagens: [Quotes] = []
    
    var listaComFiltros: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarPersonagens.delegate = self
        tablePersonagens.dataSource = self
        
        CharactersDAO.actions.getQuotesData(completion: { (list) in
            self.listaMensagens = list
        })
        
        CharactersDAO.actions.getCharactersData(completion: { (list) in
            self.listaPersonagens = list
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell") as! CelulaTableViewCell
        
        let mensagem = listaMensagens[indexPath.row].quote
        let personagem = listaComFiltros[indexPath.row]
        
        
        cell.labelNomePersonagem.text = personagem.name
        cell.labelMensagemPersonagem.text = mensagem
        
        if let url = URL(string: personagem.img) {
            cell.imagemPersonagem.setImage(url: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaComFiltros.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaComFiltros = searchText.isEmpty ? listaPersonagens : listaPersonagens.filter {($0.name.uppercased().contains(searchText.uppercased())) }
        tablePersonagens.reloadData()
    }
}
