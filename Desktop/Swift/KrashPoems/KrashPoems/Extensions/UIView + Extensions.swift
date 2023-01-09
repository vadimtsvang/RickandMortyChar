//
//  UIView + Extensions.swift
//  Krash Poems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
