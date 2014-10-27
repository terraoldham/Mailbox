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
    var messageCenter: CGPoint!
    
    
    @IBAction func onDrag(sender: UIPanGestureRecognizer){
        
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        messageView.userInteractionEnabled = true 
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began{
            messageCenter = messageView.center
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                self.messageView.center.x = point.x
            
                println("Gesture changed at: \(point)")
                if messageCenter.x <= 160 && messageCenter.x > 50 {
                    combinedView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                    
                } else if messageCenter.x < 50 {
                    combinedView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
                    
                //swiping far left
                } else if messageCenter.x > 160 && messageCenter.x < 280 {
                    combinedView.backgroundColor = UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1)
                
                //swiping right
                } else if messageCenter.x > 280 {
                    
                    
                    combinedView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1)
                
                }
            
            
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
