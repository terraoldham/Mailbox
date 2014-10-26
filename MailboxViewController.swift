//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Terra Oldham on 10/21/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var laterView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var deleteView: UIImageView!
    @IBOutlet weak var archiveView: UIImageView!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var combinedView: UIView!
    
    
    @IBAction func onDrag(sender: UIPanGestureRecognizer){
        
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began{
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 2325)
        combinedView.addGestureRecognizer(panGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
