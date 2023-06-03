//
//  AddObjectiveValueView.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class AddObjectiveValueView: ObjectiveBaseView {
    
    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.minimumDate = Date()
        datePicker.alpha = 0.02
        datePicker.backgroundColor = .white
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    func setup() {
        setupCurrencyTextField()
        setupSecondTextField()
        titleLabel.text = "Digite quanto custa seu objetivo"
        secondTitleLabel.text = "Digite quanto custa seu objetivo"
        configureTextFieldPlaceholder(secondTextField, placeholder: "DD/MM/AAAA", color: .orange.withAlphaComponent(0.4))
        secondTextField.isEnabled = false
        startDatePicker()
    }

    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        secondTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    private func startDatePicker() {
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker: )), for: .valueChanged)
        addSubview(datePicker)
        setupDatePickerConstraints()
    }
    
    func setupDatePickerConstraints() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 8),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.widthAnchor.constraint(equalTo: widthAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    
}
