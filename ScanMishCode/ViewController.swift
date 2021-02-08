//
//  ViewController.swift
//  ScanMishCode
//
//  Created by JJ on 08/02/21.
//  Copyright © 2021 John. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController,UITabBarDelegate, UITabBarControllerDelegate{

    @IBOutlet weak var tabBarCtrl: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarCtrl.delegate = self

    }
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item", item.tag )
        
        if item.tag == 2 {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destVC = storyboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController

            destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

            self.present(destVC, animated: true, completion: nil)
        }
        else if item.tag == 3 {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destVC = storyboard.instantiateViewController(withIdentifier: "InvoiceViewController") as! InvoiceViewController

            destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

            self.present(destVC, animated: true, completion: nil)
        }

    }


    
    
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//    }
//    let popupController = ViewController()
//    popupController.modalPresentationStyle = .overFullScreen
//    self.present(popupController, animated: true, completion: nil)
    
}

