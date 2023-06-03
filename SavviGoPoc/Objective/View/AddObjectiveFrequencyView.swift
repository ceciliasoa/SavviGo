//
//  AddObjectiveFrequencyView.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

enum Frequency: String {
    case daily = "Diariamente"
    case weekly = "Semanalmente"
    case monthly = "Mensalmente"
}

class AddObjectiveFrequencyView: ObjectiveBaseView {
    var frequencyPicker: UIPickerView?
    
    var frequency: Frequency?
    
    var dataFrequencyPicker: [Frequency] = [.daily, .weekly, .monthly]
    
    func setup() {
        setupTextField()
        setupSecondCurrencyTextField()
        setupFrequency()
        setupGoal()
    }
    
    func fecthDateFrequency() -> [Frequency] {
        return [.daily, .weekly, .monthly]
    }
    
    private func setupFrequency() {
        titleLabel.text = "Com que frequência quer guardar?"
        frequencyPicker = UIPickerView()
        mainTextField.inputView = frequencyPicker
        mainTextField.text = "Diariamente"
        frequency = .daily
    }
    
    private func setupGoal() {
        secondTitleLabel.text = "Essa é sua meta diária"
        secondTextField.isEnabled = false
        secondSubtitleLabel.text = "Caso o valor da meta esteja muito alto, você pode aumentar o prazo do objetivo"
    }
}
