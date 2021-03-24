//
//  ArticleContainer.swift
//  abidjan.net
//
//  Created by Pentest225 on 3/23/21.
//  Copyright © 2021 Pentest225. All rights reserved.
//

import UIKit

class ArticleContainer: UITableViewCell {

    @IBOutlet weak var sourceArticle: UILabel!
    @IBOutlet weak var dateArticle: UILabel!
    @IBOutlet weak var titleArticle: UILabel!
    @IBOutlet weak var imageArticle: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
