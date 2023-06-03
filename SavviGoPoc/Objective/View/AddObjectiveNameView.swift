//
//  AddObjectiveNameView.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class AddObjectiveNameView: ObjectiveBaseView {
    
    func setup() {
        setupTextField()
        titleLabel.text = "Dê um nome para o seu objetivo!"
        configureTextFieldPlaceholder(mainTextField, placeholder: "nome", color: .orange.withAlphaComponent(0.4))
        subtitleLabel.text = "O nome pode ser útil para identificar seus objetivos e criar uma motivação para atingi-lo"
    }
}
