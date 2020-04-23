//
//  Character.swift
//  breakingApp
//
//  Created by Vicente Patricio on 13/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

struct Character: Codable {
    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    let better_call_saul_appearance: [Int]
}
