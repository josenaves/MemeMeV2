//
//  MemeCollectionViewController.swift
//  MemeMeV2
//
//  Created by José Naves Moura Neto on 23/12/18.
//  Copyright © 2018 José Naves Moura Neto. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
        
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData() // forces the data reload to ensure we got updated memes
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.row]
        
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let memeDetailViewController = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetailViewController.meme = memes[indexPath.row]
        navigationController!.pushViewController(memeDetailViewController, animated: true)
    }
}
