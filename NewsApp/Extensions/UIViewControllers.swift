//
//  UIViewControllers.swift
//  NewsApp
//
//  Created by Farhan Saqib on 18/07/2023.
//

import UIKit
import SafariServices

extension UIViewController{
    
    //Opening Web View in Safari ViewController
    func openWebView(_ url: String){
        guard let url = URL.init(string: url) else {
            debugPrint("Error Converting URL")
            return
        }
        //Using Configs to make sure we use reader mode if Available.
        //Since we have a news based app, Reader mode is better option for users.
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let viewController = SFSafariViewController(url: url, configuration: config)
        present(viewController, animated: true)
    }
}
