//
//  DetailViewController.swift
//  MemeMeV2
//
//  Created by José Naves Moura Neto on 23/12/18.
//  Copyright © 2018 José Naves Moura Neto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.label.text = self.meme.topText
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
