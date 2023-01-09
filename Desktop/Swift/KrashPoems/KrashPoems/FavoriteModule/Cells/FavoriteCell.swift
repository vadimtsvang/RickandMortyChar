//
//  FavoriteCell.swift
//  KrashPoems
//
//  Created by Vadim on 23.11.2022.
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
