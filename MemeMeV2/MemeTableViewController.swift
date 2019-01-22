//
//  MemeTableViewController.swift
//  MemeMeV2
//
//  Created by José Naves Moura Neto on 11/12/18.
//  Copyright © 2018 José Naves Moura Neto. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MemeTableViewController - viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MemeTableViewController - viewWillAppear")
        print("memes: \(memes ?? [])")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // Get the selected adventure
//        let selectedAdventure = adventures[(indexPath as NSIndexPath).row]
//        
//        // Get the first node
//        let firstNodeInTheAdventure = selectedAdventure.startNode
//
//        // Get a StoryNodeController from the Storyboard
//        let storyNodeController = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController")as! StoryNodeViewController
//
//        // Set the story node so that we will see the start of the story
//        storyNodeController.storyNode = firstNodeInTheAdventure
//
//        // Push the new controller onto the stack
//        self.navigationController!.pushViewController(storyNodeController, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
