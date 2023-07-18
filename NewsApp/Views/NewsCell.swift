//
//  NewsCell.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var lblSourceAndAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(_ news: News){
        updateImage(news.urlToImage ?? "")
        updateTitle(news.title ?? "")
        updateDescription(news.description ?? "")
        updateSourceAndAuthor(news.source?.name ?? "", author: news.author ?? "")
        updateDate(news.publishedAt ?? "")
    }
    
    private func updateImage(_ url: String){
        imgNews.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: Constants.imgPlaceholder))
    }
    
    private func updateTitle(_ title: String){
        lblTitle.text = title
    }
    
    private func updateDescription (_ description: String){
        tvDescription.isScrollEnabled = false
        tvDescription.text = description
        tvDescription.sizeToFit()
    }
    
    private func updateSourceAndAuthor(_ source: String, author: String){
        let fromSource: String = source.count > 0 ? "From \(source) " : ""
        let byAuthor: String = author.count > 0 ? "By \(author)" : ""
        lblSourceAndAuthor.text = fromSource + byAuthor
    }
    
    private func updateDate(_ date: String){
        if let date = date.stringToDateConverter(date){
            lblDate.text = date.dateToStringConverter(date)
        }else{
            lblDate.text = ""
        }
    }
    
    
}
