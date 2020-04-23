//
//  Quotes.swift
//  breakingApp
//
//  Created by Vicente Patricio on 15/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

struct Quotes: Codable {
    let quote_id: Int
    let quote: String
    let author: String
    let series: String
}
