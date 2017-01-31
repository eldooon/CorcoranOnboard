//
//  TaxiOnBoardViewController.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/30/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit
import Onboard

class AgentSuiteViewController : UIViewController {
    
    var onboardingVC = OnboardingViewController()
    var onBoarded = false
    var suiteTitle = String()
    var suiteImage = UIImage()
    var suiteBody1 = String()
    var suiteBody2 = String()
    var suiteBody3 = String()
    var suiteBodyLast = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        If not onBoarded, show onboard
        if onBoarded == false {
            createOnboard()
        }
    }
    
    func createOnboard() {
        
        
        let firstPage = OnboardingContentViewController(title: self.suiteTitle, body: self.suiteBody1, image: self.suiteImage, buttonText: "Continue") { () -> Void in
            
            self.onboardingVC.moveNextPage()
        }
        
        let secondPage = OnboardingContentViewController(title: self.suiteTitle, body: self.suiteBody2, image: self.suiteImage, buttonText: "Continue") { () -> Void in
            
            self.onboardingVC.moveNextPage()
        }
        
        let thirdPage = OnboardingContentViewController(title: self.suiteTitle, body: self.suiteBody3, image: self.suiteImage, buttonText: "Continue") { () -> Void in
            
            self.onboardingVC.moveNextPage()
        }
        
        let LastPage = OnboardingContentViewController(title: "Congratulations!", body: self.suiteBodyLast, image: self.suiteImage, buttonText: "Complete") { () -> Void in
            
            print("Complete")
            self.onBoarded = true
            self.onboardingVC.dismiss(animated: true, completion: {
                let _ = self.navigationController?.popToRootViewController(animated: true)
            })
        }
        
        //Onboard VC properties
        onboardingVC = OnboardingViewController.onboard(withBackgroundImage: UIImage(named: "background.jpg"), contents: [firstPage, secondPage, thirdPage, LastPage])
        onboardingVC.shouldFadeTransitions = true
        onboardingVC.shouldMaskBackground = false
        onboardingVC.shouldBlurBackground = false
        onboardingVC.fadePageControlOnLastPage = true
        onboardingVC.pageControl.pageIndicatorTintColor = UIColor.darkGray
        onboardingVC.pageControl.currentPageIndicatorTintColor = UIColor.white
        onboardingVC.skipButton.setTitleColor(UIColor.white, for: .normal)
        onboardingVC.allowSkipping = false
        onboardingVC.skipHandler = {
            
            self.onboardingVC.moveNextPage()
        }
        onboardingVC.fadeSkipButtonOnLastPage = true
        
        //Onboard VC apperance
        onboardingVC.underPageControlPadding = 25
        
        self.present(onboardingVC, animated: true, completion: nil)
        
    }
    
    func popToTheRootOfNav() {
        navigationController?.popToRoot(animated: true)
    }
    
}
