//
//  FavoriteCell.swift
//  Krash Poems
//
//  Created by Vadim on 09.01.2023.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
