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
        let teacherView = TeachersView()
        let teacherVC = UIHostingController(rootView: teacherView)
        teacherVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house.fill"), tag: 1)
        
        let busketPageView = TeacherView(viewModel: TeacherViewModel(teacher: Teacher(id: "1", name: "Ержан", lastName: "Чонгаров", age: 42, university: "SDU", avgGrade: 3.5, numberOfGrades: 30),image: Image("teacher")))
        let busketVC = UIHostingController(rootView: busketPageView)
    
        teacherVC.navigationController?.isNavigationBarHidden = true
        busketVC.navigationController?.isNavigationBarHidden = true
        setViewControllers([teacherVC, busketVC], animated: true)
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
        
        roundLayer.fillColor = UIColor(hexString: "#1D2473").cgColor
        
        tabBar.unselectedItemTintColor = UIColor(hexString: "#697888")
        tabBar.tintColor = UIColor(hexString: "#E6A283")
    }
}
