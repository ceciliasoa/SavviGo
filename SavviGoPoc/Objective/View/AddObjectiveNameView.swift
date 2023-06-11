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
        titleLabel.text = LocalizeString.nameObjectiveTitle
        configureTextFieldPlaceholder(mainTextField, placeholder: "nome", color: .orange.withAlphaComponent(0.4))
        mainTextField.accessibilityLabel = "nameTextField"
        
        subtitleLabel.text = LocalizeString.nameObjectiveSubtitle
        
    }
}
