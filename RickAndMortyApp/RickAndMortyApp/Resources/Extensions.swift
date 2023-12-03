//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Ceren Güneş on 3.12.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {addSubview($0)}
    }
}
