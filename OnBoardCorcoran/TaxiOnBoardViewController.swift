//
//  TaxiOnBoardViewController.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/30/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit
import Onboard

class TaxiOnBoardViewController : UIViewController {
    
    var onboardingVC = OnboardingViewController()
    var onBoarded = false
    
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
        
        
        let firstPage = OnboardingContentViewController(title: "Welcome to Corcoran OnBoard!", body: "We are here to assist with all your onboarding needs.", image: UIImage(named: "Corcoran"), buttonText: "Continue") { () -> Void in
            
            self.onboardingVC.moveNextPage()
        }
        
        let secondPage = OnboardingContentViewController(title: "Training", body: "Have you completed training at the education center?", image: UIImage(named: "icon"), buttonText: "No, I need training!") { () -> Void in
            
        }
        
        let thirdPage = OnboardingContentViewController(title: "Computer Setup", body: "Has your computer been setup by helpdesk?", image: UIImage(named: "icon"), buttonText: "Request Assistance") { () -> Void in
            
        }
        
        let LastPage = OnboardingContentViewController(title: "Congratulations!", body: "You have completed onboarding! To learn more about Corcoran Applications, continue.", image: UIImage(named: "icon"), buttonText: "Learn More") { () -> Void in
            
            print("Learn More")
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
        onboardingVC.allowSkipping = true
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
