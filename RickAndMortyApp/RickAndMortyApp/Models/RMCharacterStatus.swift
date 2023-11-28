//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by Ceren Güneş on 28.11.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
