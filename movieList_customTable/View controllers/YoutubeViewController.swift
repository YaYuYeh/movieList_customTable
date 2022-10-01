//
//  YoutubeViewController.swift
//  movieList_customTable
//
//  Created by Ya Yu Yeh on 2022/9/29.
//

import UIKit
import WebKit

class YoutubeViewController: UIViewController {
    @IBOutlet weak var webkitView: WKWebView!
    var film:Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.title = film.enName
    }
    
    func updateUI(){
        //使用webkit播放youtube
        if let url = URL(string: "https://www.youtube.com/watch?v=\(self.film.trailer)"){
            print("url right")
            let request = URLRequest(url: url)
            self.webkitView.load(request)
        }
    }
}
