//
//  RMCharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Ceren Güneş on 5.12.2023.
//

import Foundation

final class RMCharacterDetailViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
