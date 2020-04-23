//
//  CelulaTableViewCell.swift
//  breakingApp
//
//  Created by Vicente Patricio on 17/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMensagemPersonagem: UILabel!
    @IBOutlet weak var labelNomePersonagem: UILabel!
    @IBOutlet weak var imagemPersonagem: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagemPersonagem.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagemPersonagem.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
