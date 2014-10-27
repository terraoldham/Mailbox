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
            
            messageView.center.x = messageCenter.x + translation.x
                println("Gesture changed at: \(point)")
            
                if messageView.center.x <= 125 && messageView.center.x > (-30) {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.combinedView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1)
                        self.laterView.alpha = 1
                        self.listView.alpha = 0
                        //yellow
                    })
                    
                    self.laterView.center.x = (self.messageView.center.x + 175)
                    
                } else if messageView.center.x < (-30) {
                    UIView.animateWithDuration(0.25, animations: { () -> Void in
                        self.combinedView.backgroundColor = UIColor(red: 0.93, green: 0.41, blue: 1.0, alpha: 1)
                        self.listView.alpha = 1
                        self.laterView.alpha = 0
                        self.archiveView.alpha = 0
                        //pink or brown
                    })
                    
                    self.listView.center.x = (self.messageView.center.x + 175)
                    
                
                } else if messageView.center.x > 195 && messageView.center.x < 350 {
                    UIView.animateWithDuration(0.25, animations: { () -> Void in
                        self.combinedView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
                        self.archiveView.alpha = 1
                        self.deleteView.alpha = 0
                        //green
                    })
                    
                    self.archiveView.center.x = (self.messageView.center.x - 175)
                
                } else if messageView.center.x > 350 {
                    UIView.animateWithDuration(0.25, animations: { () -> Void in
                        self.combinedView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
                        self.archiveView.alpha = 0
                        self.deleteView.alpha = 1
                        //red
                    })
                    
                    self.deleteView.center.x = (self.messageView.center.x - 175)
                    
                
                } else {
                    combinedView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
                    if messageView.center.x > 125 && messageView.center.x < 160 {
                        laterView.alpha = 1
                    } else {
                        archiveView.alpha = 1
                    }
            }
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            if messageView.center.x <= 125 && messageView.center.x > -30 {
                UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = 160
                }, completion: nil)
                
                
            } else if messageView.center.x > 195 && messageView.center.x < 350 {
                UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = 160
                    }, completion: nil)
                
            } else if messageView.center.x > 350 {
                UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = 520
                    self.deleteView.center.x = (self.messageView.center.x - 175)
                }, completion: nil)
                
            } else if messageView.center.x < -30 {
               UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                self.messageView.center.x = -200
                self.listView.center.x = (self.messageView.center.x + 175)
               }, completion: nil)
                    
            }
            
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
