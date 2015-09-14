//
//  FirstAppleViewController.swift
//  LayoutFrameworksTest
//
//  Created by Nikita Fomin on 14.09.15.
//  Copyright (c) 2015 Nikita Fomin. All rights reserved.
//

import UIKit

class FirstAppleViewController: UIViewController {
    
    let redView = UIView(frame: CGRectMake(10, 10, 20, 40))
    let greenView = UIView(frame: CGRectMake(10, 10, 20, 40))
    let blueView = UIView(frame: CGRectMake(10, 10, 20, 40))
    let yellowView = UIView(frame: CGRectMake(10, 10, 20, 40))
    
    override func loadView() {
        super.loadView()
        
        self.redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
        
        self.greenView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(greenView)
        
        self.blueView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueView)
        
        self.yellowView.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(yellowView)
        
        //Prep auto layout
        self.redView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.greenView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.blueView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.yellowView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Describe views
        let views = Dictionary(dictionaryLiteral: ("red", self.redView), ("green", self.greenView), ("blue", self.blueView), ("yellow", self.yellowView))
        
        // Describe metrics
        let metrics = Dictionary(dictionaryLiteral: ("spacing", 10), ("priority", 20))
        
        //Horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-spacing-[red(>=100,<=200@750)]-0@priority-[blue(==red)]-spacing-|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(horizontalConstraints)
        let horizontalConstraintsGreen = NSLayoutConstraint.constraintsWithVisualFormat("H:|-spacing-[green]-spacing-|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(horizontalConstraintsGreen)
        
        //Vertical constraints
        let verticalConstraintsRed = NSLayoutConstraint.constraintsWithVisualFormat("V:|[red]-spacing-[green(40)]-spacing-|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsRed)
        let verticalConstraintsBlue = NSLayoutConstraint.constraintsWithVisualFormat("V:|[blue]-spacing-[green(40)]-spacing-|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsBlue)
        
        // Limitations
        // 
        // aspect ratio not available
        // we setup vertical constraints for green view twice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
