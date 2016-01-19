//
//  ViewController.swift
//  Dynamics Demo
//
//  Created by Ho Jeannie on 1/17/16.
//  Copyright © 2016 Ho Jeannie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!

    //A: Dynamically adding behaviors
    var firstContact=false;
    
    //User Interaction
    var square: UIView!
    var snap: UISnapBehavior!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1: Adding the element
        square = UIView(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square);
        
        //2: Adding gravity
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        //gravity.setAngle(45, magnitude: 0.5);
        animator.addBehavior(gravity)

        
        //4: Adding barriers
        let barrier=UIView(frame:CGRect(x: 0, y: 300, width: 120, height: 50))
        barrier.backgroundColor=UIColor.redColor();
        view.addSubview(barrier);
        
        //3: Adding collision boundaries
        collision=UICollisionBehavior(items: [square])
        // Add thsi line to use the delegate
        collision.collisionDelegate=self;
        
        // add a boundary that has the same frame as the barrier
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary=true
        animator.addBehavior(collision);
       
        
        //Adding elsticity
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        
        
        //Adding trails
        var updateCount = 0
        collision.action = {
            if (updateCount % 3 == 0) {
                let outline = UIView(frame: self.square.bounds)
                outline.transform = self.square.transform
                outline.center = self.square.center
                
                outline.alpha = 0.5
                outline.backgroundColor = UIColor.clearColor()
                outline.layer.borderColor = self.square.layer.presentationLayer()!.backgroundColor
                outline.layer.borderWidth = 1.0
                self.view.addSubview(outline)
            }
            
            ++updateCount
        }
        
        
        

    }
    
    //4: Polling when collision occurs using delegate
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        
        print("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
    
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
        //B: Dynamically creating objects and adding them to behaviors (The above code detects the initial contact between the barrier and the square, creates a second square and adds it to the collision and gravity behaviors. In addition, you set up an attachment behavior to create the effect of attaching a pair of objects with a virtual spring.)
        
        if (!firstContact) {
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem:square)
            animator.addBehavior(attach)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

