import Foundation
import SwiftUI
import UIKit

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let homeView = MainPageView()
        let homeVC = UIHostingController(rootView: homeView)
        homeVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house.fill"), tag: 1)
        
        let busketPageView = BusketPageView(viewModel: BusketViewModel.shared)
        let busketVC = UIHostingController(rootView: busketPageView)
        
        let profilePageView = ProfilePageView()
        let profileVC = UIHostingController(rootView: profilePageView)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 3)
        busketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), tag: 3)
        
        homeVC.navigationController?.isNavigationBarHidden = true
        profileVC.navigationController?.isNavigationBarHidden = true
        busketVC.navigationController?.isNavigationBarHidden = true
        setViewControllers([homeVC, busketVC, profileVC], animated: true)
    }
    

    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor(hexString: "#242B33").cgColor
        
        tabBar.unselectedItemTintColor = UIColor(hexString: "#697888")
        tabBar.tintColor = UIColor(hexString: "#E6A283")
    }
}
