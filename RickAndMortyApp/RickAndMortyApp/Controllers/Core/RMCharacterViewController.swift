//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Ceren Güneş on 26.11.2023.
//

import UIKit

///Controller to show and search for Characters 
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
   
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        setUpView()
    }
    
    private func setUpView() {
        characterListView.delegate = self
        
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    
    //MARK: - Delegate Implementation
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        //Open Detail Controller for that character
        let viewModel = RMCharacterDetailViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
