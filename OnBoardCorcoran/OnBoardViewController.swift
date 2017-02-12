//
//  ViewController.swift
//  OnBoardCorcoran
//
//  Created by Eldon Chan on 1/27/17.
//  Copyright © 2017 Eldon. All rights reserved.
//

import UIKit
import Onboard
import MessageUI
import Firebase


class OnBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate {
    
    var onBoarded = false
    var agentSuiteCollectionView : UICollectionView!
    var onboardingVC = OnboardingViewController()
    let data = FirebaseData()
    let moreMenuLauncher = MoreMenuLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        data.retrieveData()
        setUpEventCollectionCells()
        createLayout()
        print("COUNT FROM CONTROLLER \(data.firebaseData.count)")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        agentSuiteCollectionView.reloadData()
        
//        If not onBoarded, show onboard        
//        if onBoarded == false {
//            createOnboard()
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createLayout() {
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: AgentSuiteStyle.imageOfMoreButton, style: .done, target: self, action: #selector(moreButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: AgentSuiteStyle.imageOfSearchButton, style: .done, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Corcoran OnBoard"
        
        
        view.addSubview(agentSuiteCollectionView)
        agentSuiteCollectionView.backgroundColor = UIColor.clear
        agentSuiteCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func createOnboard() {
        
        
        let firstPage = OnboardingContentViewController(title: "Welcome to Corcoran OnBoard!", body: "We are here to assist with all your onboarding needs.", image: UIImage(named: "Corcoran"), buttonText: "Continue") { () -> Void in
            
            self.onboardingVC.moveNextPage()
        }
        
        let secondPage = OnboardingContentViewController(title: "Training", body: "Have you completed training at the education center?", image: UIImage(named: "icon"), buttonText: "No, I need training!") { () -> Void in
            
            self.sendTrainingEmail()
        }
        
        let thirdPage = OnboardingContentViewController(title: "Computer Setup", body: "Has your computer been setup by helpdesk?", image: UIImage(named: "icon"), buttonText: "Request Assistance") { () -> Void in
            
            self.sendHelpdeskEmail()
        }
        
        let LastPage = OnboardingContentViewController(title: "Congratulations!", body: "You have completed onboarding! To learn more about Corcoran Applications, continue.", image: UIImage(named: "icon"), buttonText: "Learn More") { () -> Void in
            
            print("Learn More")
            self.onBoarded = true
            self.onboardingVC.dismiss(animated: true, completion: nil)
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
    
    func sendTrainingEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["Training@corcoran.com"])
            mail.setSubject("New Agent, Need Training!")
            mail.setMessageBody("Hello I am a new agent and I need training!", isHTML: true)
            
            self.onboardingVC.present(mail, animated: true)
        } else {
            // show failure alert
            print("NOOOO")
        }
    }
    
    func sendHelpdeskEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["Helpdesk@corcoran.com"])
            mail.setSubject("New Agent, Need Helpdesk setup!!")
            mail.setMessageBody("Hello I am a new agent and I need a setup!", isHTML: true)
            
            self.onboardingVC.present(mail, animated: true)
        } else {
            // show failure alert
            print("NOOOO")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func moreButtonTapped() {
        
        moreMenuLauncher.showMenu()
    
    }
    
    func setUpEventCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: screenWidth/2.005, height: screenWidth/2.005)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        
        agentSuiteCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        agentSuiteCollectionView.dataSource = self
        agentSuiteCollectionView.delegate = self
        agentSuiteCollectionView.register(AgentSuiteCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        agentSuiteCollectionView.showsVerticalScrollIndicator = false
        agentSuiteCollectionView.showsHorizontalScrollIndicator = false
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.firebaseData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! AgentSuiteCollectionViewCell
        
        cell.agentSuiteImageView.image = data.firebaseData[indexPath.item].suiteImage
        cell.agentSuiteLabel.text = data.firebaseData[indexPath.item].suiteName
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        var agentSuiteVC = AgentSuiteViewController()
        let suiteList = data.firebaseData
        
        agentSuiteVC.suiteTitle = suiteList[indexPath.item].suiteName
        agentSuiteVC.suiteImage = suiteList[indexPath.item].suiteImage
        agentSuiteVC.suiteBody1 = suiteList[indexPath.item].suiteBody1
        agentSuiteVC.suiteBody2 = suiteList[indexPath.item].suiteBody2
        agentSuiteVC.suiteBody3 = suiteList[indexPath.item].suiteBody3
        agentSuiteVC.suiteBodyLast = suiteList[indexPath.item].suiteBodyLast
        
        self.navigationController?.pushViewController(agentSuiteVC, animated: true)
    }
    
}

