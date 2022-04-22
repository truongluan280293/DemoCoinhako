//
//  HomeNavigationController.swift
//  coinhako
//
//  Created by Macbook on 22/04/2022.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupNav()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func setupNav() {

        if #available(iOS 15, *) {
            let configNav = UINavigationBarAppearance()
            configNav.configureWithOpaqueBackground()
            configNav.titleTextAttributes = [
                .foregroundColor: UIColor.init(named: "NavTitle") ?? .white,
                .font: FontHelper.font(name: .bold, size: 26)
            ]
            configNav.backgroundColor = UIColor.init(named: "BGLineDark")
            self.navigationBar.standardAppearance = configNav
            self.navigationBar.compactAppearance = configNav
            self.navigationBar.scrollEdgeAppearance = configNav
        } else {
            self.navigationBar.backgroundColor = UIColor.init(named: "TextSub")
            self.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.init(named: "BGLineDark") ?? .white,
                .font: FontHelper.font(name: .bold, size: 26)
            ]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
