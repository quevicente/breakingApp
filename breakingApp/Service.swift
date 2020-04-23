//
//  Service.swift
//  breakingApp
//
//  Created by Vicente Patricio on 13/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit
import Alamofire

enum Endpoint: String {
    case allCharacters = "https://www.breakingbadapi.com/api/characters"
    case allQuotes = "https://www.breakingbadapi.com/api/quotes"
    
}

class Service {
    
    static let actions = Service()
    
    public func getAllCharacters(completion: @escaping ([Character]) -> Void) {
        AF.request(Endpoint.allCharacters.rawValue, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let data = response.data else { return }
            
            do {
                let response = try JSONDecoder().decode(Array<Character>.self, from: data)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
    
    public func getAllQuotes(completion: @escaping ([Quotes]) -> Void){
        AF.request(Endpoint.allQuotes.rawValue, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let data = response.data else { return }
            
            do {
                let response = try JSONDecoder().decode(Array<Quotes>.self, from: data)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
    
    public func getCharacterBy(id: Int){
        
    }
    
    public func getCharacterBy(name: String){
        
    }
    
}
