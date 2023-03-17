//
//  LatestCollectionViewCell.swift
//  News Demo
//
//  Created by Harindra Pittalia on 16/02/23.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var isFavourite: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(article: Article) {
        newsTitle.text = article.title
        timeLbl.text = "\(article.publishedAt)"
        
        let url = URL(string: article.urlToImage ?? "")
        if let url = url {
            let data = try? Data(contentsOf: url)
            newsImage.image = UIImage(data: data!)
        }
    }
    

}
