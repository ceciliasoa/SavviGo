//
//  ObjectiveViewController.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

protocol objectiveDelegate: AnyObject {
    func objectiveData(data: ObjectiveEntity)
}

class ObjectiveViewController: UIViewController {
    
    var goal: Double = 0.0
    
    weak var delegate: objectiveDelegate?
    
    let objectiveNameView = AddObjectiveNameView()
    let objectiveValueView = AddObjectiveValueView()
    let objectiveFrequencyView = AddObjectiveFrequencyView()
    
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setupViews()
    }
    
    func setupViews() {
        objectiveNameView.setup()
        objectiveValueView.setup()
        objectiveFrequencyView.setup()
        view.backgroundColor = .white
        view = objectiveNameView
        textFieldDelegates()
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
        guard let name = objectiveNameView.mainTextField.text,
              let frequency = objectiveFrequencyView.frequency?.rawValue,
              let valueCurrency = objectiveValueView.mainTextField as? CurrencyTextField else {return}
        let objective = ObjectiveEntity(name: name,
                             initialDate: Date(),
                             finalDate: objectiveValueView.datePicker.date,
                             completeDays: 0,
                             goalValue: goal,
                             goalStatus: false,
                             frequency: frequency,
                             isCurrent: true,
                             savedValue: 0.0,
                             value: valueCurrency.getDoubleValue() ?? 0.0)
        
        delegate?.objectiveData(data: objective)
        dismiss(animated: true, completion: nil)
    }
    
    
    private func screenSelect() -> Int {
        if view == objectiveNameView {
            return 0
        } else if view == objectiveValueView {
            return 1
        } else {
            return 2
        }
    }
    
    private func textFieldDelegates() {
        objectiveFrequencyView.frequencyPicker?.delegate = self
        objectiveFrequencyView.frequencyPicker?.dataSource = self
        objectiveNameView.mainTextField.delegate = self
        objectiveValueView.mainTextField.delegate = self
        objectiveValueView.secondTextField.delegate  = self
        objectiveFrequencyView.mainTextField.delegate  = self
        objectiveFrequencyView.secondTextField.delegate = self
        
        objectiveFrequencyView.mainTextField.tag = 3
    }
    
    private func calculatorObjective() {
        guard let currency = objectiveValueView.mainTextField as? CurrencyTextField,
              let frequency = objectiveFrequencyView.frequency
        else { return }
        
        goal = ObjectiveEntity.calulateValue(deadline: objectiveValueView.datePicker.date,
                                             objective: currency.getDoubleValue() ?? 0.0,
                                             frequency: frequency,
                                             goalStatus: false)
        objectiveFrequencyView.secondTextField.text = goal.getCurrencyFormat()
    }
}

extension ObjectiveViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculatorObjective()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 3 {
            calculatorObjective()
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
        calculatorObjective()
    }

}
