//
//  DashboardViewController.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setNavBar()
    }
    
    func setNavBar() {
        let nav = navigationController
        navigationItem.title = LocalizeString.objective
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        addButton.tintColor = .orange
        navigationItem.rightBarButtonItem = addButton
        
        nav?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black as Any, .font: UIFont.rounded(size: 42, weight: .medium)]
    }
    
    @objc func addTapped() {
        let controller = ObjectiveViewController()
        let nav = UINavigationController.init(rootViewController: controller)

        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }

}
