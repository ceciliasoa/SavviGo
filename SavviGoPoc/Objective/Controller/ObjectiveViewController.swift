//
//  ObjectiveViewController.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class ObjectiveViewController: UIViewController {

    let objectiveNameView = AddObjectiveNameView()
    let objectiveValueView = AddObjectiveValueView()
    let objectiveFrequencyView = AddObjectiveFrequencyView()
    
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setupViews()
        
        objectiveFrequencyView.frequencyPicker?.delegate = self
        objectiveFrequencyView.frequencyPicker?.dataSource = self

    }
    
    func setupViews() {
        objectiveNameView.setup()
        objectiveValueView.setup()
        objectiveFrequencyView.setup()
        view.backgroundColor = .white
        view = objectiveNameView
    }
    
    // MARK: Nav Bar
    func configureNavBar() {
        let leftButton = UIBarButtonItem(title: LocalizeString.cancel, style: .plain, target: self, action: #selector(leftButtonAction))
        leftButton.tintColor = .orange
        let rightButton = UIBarButtonItem(title: LocalizeString.next, style: .plain, target: self, action: #selector(rightButtonAction))
        rightButton.tintColor = .orange
        navigationItem.setRightBarButton(rightButton, animated: false)
        navigationItem.setLeftBarButton(leftButton, animated: false)
    }
    
    @objc func leftButtonAction() {
        
        switch screenSelect() {
        case 0:
            self.dismiss(animated: true, completion: nil)
        case 1:
            navigationItem.leftBarButtonItem?.title = LocalizeString.cancel
            navigationItem.leftBarButtonItem?.tintColor = .orange
            view = objectiveNameView
            
        case 2:
            navigationItem.rightBarButtonItem?.title = LocalizeString.next
            navigationItem.rightBarButtonItem?.tintColor = .orange
            view = objectiveValueView
            
        default:
            break
        }
        
    }
    
    @objc func rightButtonAction() {
        
        switch screenSelect() {
        case 0:
            navigationItem.leftBarButtonItem?.title = LocalizeString.back
            navigationItem.leftBarButtonItem?.tintColor = .orange
            view = objectiveValueView
            
        case 1:
            navigationItem.rightBarButtonItem?.title = LocalizeString.save
            navigationItem.rightBarButtonItem?.tintColor = .orange
            view = objectiveFrequencyView
            objectiveFrequencyView.mainTextField.becomeFirstResponder()
 
        case 2:
            save()
            
        default:
            break
        }
    }
    
    func save() {
        dismiss(animated: true, completion: nil)
    }
    
    func screenSelect() -> Int {
        if view == objectiveNameView {
            return 0
        } else if view == objectiveValueView {
            return 1
        } else {
            return 2
        }
    }

}

extension ObjectiveViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        objectiveFrequencyView.dataFrequencyPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(objectiveFrequencyView.dataFrequencyPicker[row].rawValue)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        objectiveFrequencyView.frequency = objectiveFrequencyView.dataFrequencyPicker[row]
        objectiveFrequencyView.mainTextField.text = String(objectiveFrequencyView.dataFrequencyPicker[row].rawValue)
        
    }

}
