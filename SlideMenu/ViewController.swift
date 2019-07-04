//
//  ViewController.swift
//  SlideMenu
//
//  Created by Alivelu Ravula on 4/16/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuVC:MenuVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuVC=self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        
        let ritSwip=UISwipeGestureRecognizer(target: self, action:#selector(respondToGesture))
        ritSwip.direction=UISwipeGestureRecognizerDirection.right
        
        let leftSwip=UISwipeGestureRecognizer(target: self, action: #selector(respondToGesture))
        leftSwip.direction=UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(ritSwip)
        self.view.addGestureRecognizer(leftSwip)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func respondToGesture(gesture:UISwipeGestureRecognizer)
    {
        if (gesture.direction==UISwipeGestureRecognizerDirection.right)
        {
            
        }else if(gesture.direction==UISwipeGestureRecognizerDirection.left)
        {
            closeOnSwipe()
            
        }
        
    }
     func closeOnSwipe()
     {
        if(AppDelegate.isMenuDisplay==true)
        {
            showMenu()
        }else{
            closeMenu()
        }
    }
    
    

    @IBAction func menu_action(_ sender: UIBarButtonItem) {
        if(AppDelegate.isMenuDisplay==true)
        {
            showMenu()
        }else{
            closeMenu()
        }
        
        
    }
    func showMenu()
    {
        UIView.animate(withDuration: 0.3) { ()-> Void in
         self.menuVC.view.frame=CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
         
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
        AppDelegate.isMenuDisplay=false
        }
    }
    func closeMenu()
    {
        UIView.animate(withDuration: 0.3,animations: { ()-> Void in
self.menuVC.view.frame=CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        })
        {
            (finished) in
            self.menuVC.view.removeFromSuperview()

        }
        AppDelegate.isMenuDisplay=true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

