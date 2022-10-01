//
//  MovieTableViewCell.swift
//  movieList_customTable
//
//  Created by Ya Yu Yeh on 2022/9/29.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var chNameLbl: UILabel!
    @IBOutlet weak var enNameLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
