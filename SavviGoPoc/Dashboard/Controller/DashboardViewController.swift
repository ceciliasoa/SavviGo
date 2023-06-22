//
//  DashboardViewController.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class DashboardViewController: UIViewController, objectiveDelegate {
    var cell = DashboardView()
    
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemGray5
        setNavBar()
        setupTableView()
        localNotification()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DashboardView")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
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
        controller.delegate = self
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    func objectiveData(data: ObjectiveEntity) {
        cell.objectiveLabel.text = data.name
        cell.goalLabel.text = data.goalValue.getCurrencyFormat()
        cell.savedLabel.text = data.savedValue.getCurrencyFormat()
        cell.valueLabel.text = data.value.getCurrencyFormat()
        tableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension DashboardViewController {
    
    func localNotification() {
       
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            guard granted else { return }
            print(error ?? "")
            self.getNotificationSettings()
        }
        let content = UNMutableNotificationContent()
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 0
        
        content.title = "Hora de guardar"
        content.body = "Você já alcançou sua meta hoje?"
        content.categoryIdentifier = "category"
        dateComponents.weekday = 4
        
        
        let replyAction = UNNotificationAction(identifier: "action", title: "guardar", options: UNNotificationActionOptions.init(rawValue: 0))
        
        let actionCategory = UNNotificationCategory(identifier: "category", actions: [replyAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", categorySummaryFormat: "", options: .customDismissAction)
        
        UNUserNotificationCenter.current().setNotificationCategories([actionCategory])
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        
        let request = UNNotificationRequest(identifier: "save-remember", content: content, trigger: trigger)
        
        center.getPendingNotificationRequests { (notificationsList) in
            if !notificationsList.contains(request) {
                center.add(request) { (error) in
                    print(error ?? "")
                }
            }
        }
        
        
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
        
}

extension DashboardViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "action":
            cell.savedLabel.text = "R$ 200,00"
            tableView.reloadData()
            
        default:
            break
        }
    }
}

