//
//  CharactersDAO.swift
//  breakingApp
//
//  Created by Vicente Patricio on 13/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class CharactersDAO: NSObject {
    
    static let actions = CharactersDAO()
    
    private var listaCharacters: [Character] = [] {
        didSet {
            print("Loaded characters!")
        }
    }
    
    private var listaQuotes: [Quotes] = [] {
        didSet {
            print("Loaded quotes!")
        }
    }
    
    public func setAllQuotes(quotes: [Quotes]){
        self.listaQuotes = quotes
    }
    
    public func setAllCharacters(character: [Character]) {
        self.listaCharacters = character
    }
    
    public func getAllCharacters() -> [Character] {
        return listaCharacters
    }
    
    public func getAllQuotes() -> [Quotes]{
        return listaQuotes
    }
    
    public func getAllData(completion: @escaping([Character], [Quotes]) -> Void) {
        
    }
    
    public func getQuotesData(completion: @escaping([Quotes]) -> Void){
        Service.actions.getAllQuotes { (response) in
            self.setAllQuotes(quotes: response)
            completion(self.getAllQuotes())
        }
    }
    
    public func getCharactersData(completion: @escaping([Character]) -> Void) {
        Service.actions.getAllCharacters { (response) in
            self.setAllCharacters(character: response)
            
            completion(self.getAllCharacters())
        }
    }
}
