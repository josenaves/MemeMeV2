//
//  MemeTableViewController.swift
//  MemeMeV2
//
//  Created by José Naves Moura Neto on 11/12/18.
//  Copyright © 2018 José Naves Moura Neto. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var memes: [Meme] {
        get {
            return appDelegate.memes
        }
        set(_memes) {
            appDelegate.memes = _memes
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the image and text
        cell.memeImage?.image = meme.memedImage
        cell.memeText?.text = "\(meme.topText) \(meme.bottomText)"
        
        return cell
    }
    
    // MARK - Send the user to the meme view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get the selected meme
        let selectedMeme = memes[indexPath.row]
        
        // get the DetailController from the storyboard
        let memeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        // set the meme selected
        memeDetailViewController.meme = selectedMeme
        
        // push the new controlle onto the stack
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // MARK: To delete the meme
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
