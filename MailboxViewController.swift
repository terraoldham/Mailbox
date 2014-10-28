//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Terra Oldham on 10/21/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet var onTap: UITapGestureRecognizer!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var laterView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var deleteView: UIImageView!
    @IBOutlet weak var archiveView: UIImageView!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var combinedView: UIView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet var onListTap: UITapGestureRecognizer!
    @IBOutlet weak var fullListView: UIImageView!
    var messageCenter: CGPoint!
    
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var navChoices = [0, 1, 2]
        var navChoice = navChoices[segmentedControl.selectedSegmentIndex]
        if navChoice == 2 {
            println("ajksdglajsdg")
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.combinedView.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
                self.messageView.center.x = 520
                self.archiveView.center.x = (self.messageView.center.x - 175)
                self.archiveView.alpha = 1
                self.deleteView.alpha = 0
            UIView.animateWithDuration(0.5, delay: 0.2, options: nil, animations: { () -> Void in
                self.combinedView.alpha = 0
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.5, options: nil, animations: { () -> Void in
                self.feedView.center.y += -80
                }, completion: nil)
                
            })
        }  else if navChoice == 0 {
            println("ajksdglajsdg")
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.combinedView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1)
                self.messageView.center.x = -200
                self.laterView.center.x = (self.messageView.center.x + 175)
                self.laterView.alpha = 1
                self.listView.alpha = 0
                UIView.animateWithDuration(0.5, delay: 0.2, options: nil, animations: { () -> Void in
                    self.combinedView.alpha = 0
                    }, completion: nil)
                UIView.animateWithDuration(0.5, delay: 0.5, options: nil, animations: { () -> Void in
                    self.feedView.center.y += -80
                    }, completion: nil)
                
            })
        }

    }
   
    
    
    
    
    @IBAction func onTapping(sender: UITapGestureRecognizer) {
        println("tap")
        scrollView.contentSize = CGSize(width: 320, height: 2325 - 80)
        self.rescheduleView.alpha = 0
        self.laterView.alpha = 0
        self.archiveView.alpha = 0
        UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
            self.combinedView.alpha = 0
            }, completion: nil)
        UIView.animateWithDuration(0.25, delay: 0.7, options: nil, animations: { () -> Void in
            self.feedView.center.y += -80
            }, completion: nil)
    }
    
    
    //@IBAction func onListTapping(sender: UITapGestureRecognizer) {
        //println("tap")
        //scrollView.contentSize = CGSize(width: 320, height: 2325 - 80)
        //self.fullListView.alpha = 0
        //self.laterView.alpha = 0
        //self.archiveView.alpha = 0
        //UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
            //self.combinedView.alpha = 0
            //}, completion: nil)
        //UIView.animateWithDuration(0.25, delay: 0.7, options: nil, animations: { () -> Void in
            //self.feedView.center.y += -80
            //}, completion: nil)
   // }
    
    
    
    
    
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
                
                if velocity.x < 0 {
                    UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                        self.messageView.center.x = -200
                        self.rescheduleView.alpha = 1
                        self.scrollView.contentSize = self.rescheduleView.image!.size
                    }, completion: nil)
                } else if velocity.x > 0 {
                    UIView.animateWithDuration(0.4, delay: 0.0, options: nil, animations: { () -> Void in
                        self.messageView.center.x = 160
                        self.laterView.center.x = self.messageView.center.x + 175
                    }, completion: nil)
                    
                }
                
            } else if messageView.center.x > 195 && messageView.center.x < 350 {
                UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = 160
                    self.archiveView.center.x = self.messageView.center.x - 175
                    }, completion: nil)
                
                
            } else if messageView.center.x > 350 {
                UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = 520
                    self.deleteView.center.x = (self.messageView.center.x - 175)
                }, completion: nil)
                UIView.animateWithDuration(0.2, delay: 0.5, options: nil, animations: { () -> Void in
                    self.combinedView.alpha = 0
                    }, completion: nil)
                UIView.animateWithDuration(0.5, delay: 0.8, options: nil, animations: { () -> Void in
                    self.feedView.center.y += -80
                    }, completion: nil)

                
            } else if messageView.center.x < -30 {
               UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: { () -> Void in
                    self.messageView.center.x = -200
                    self.listView.center.x = (self.messageView.center.x + 175)
               }, completion: nil)
                self.fullListView.alpha = 1
                
                UIView.animateWithDuration(0.2, delay: 0.5, options: nil, animations: { () -> Void in
                    self.combinedView.alpha = 0
                }, completion: nil)
                
                UIView.animateWithDuration(0.5, delay: 0.8, options: nil, animations: { () -> Void in
                    //self.feedView.center.y += -80
                }, completion: nil)
                
            }
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 2325)
        combinedView.addGestureRecognizer(panGestureRecognizer)
        rescheduleView.addGestureRecognizer(onTap)
        onTap.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
