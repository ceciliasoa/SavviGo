//
//  ObjectiveBaseView.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 27/05/23.
//

import UIKit

class ObjectiveBaseView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var mainTextField: UITextField!
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var secondTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var secondSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var secondTextField: UITextField!
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupKeyboardDismissRecongnizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField() {
        mainTextField = UITextField()
        mainTextField.borderStyle = .none
        mainTextField.backgroundColor = .clear
        mainTextField.font = UIFont.rounded(size: 42, weight: .medium)
        mainTextField.textColor = .orange
        mainTextField.tintColor = .orange
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    func setupCurrencyTextField() {
        mainTextField = CurrencyTextField()
        mainTextField.keyboardType = .numberPad
        mainTextField.font = UIFont.rounded(size: 42, weight: .medium)
        mainTextField.textColor = .orange
        mainTextField.text = "R$ 00,00"
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    func setupSecondTextField() {
        secondTextField = UITextField()
        secondTextField.borderStyle = .none
        secondTextField.backgroundColor = .clear
        secondTextField.font = UIFont.rounded(size: 42, weight: .medium)
        secondTextField.textColor = .orange
        secondTextField.tintColor = .orange
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        setupSecondView()
    }
    
    func setupSecondCurrencyTextField() {
        secondTextField = CurrencyTextField()
        secondTextField.keyboardType = .numberPad
        secondTextField.font = UIFont.rounded(size: 42, weight: .medium)
        secondTextField.textColor = .black
        secondTextField.text = "R$ 00,00"
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        setupSecondView()
    }
    
    func configureTextFieldPlaceholder(_ textField: UITextField, placeholder: String, color: UIColor) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: color ,
            .font: UIFont.rounded(size: 42, weight: .medium)
        ])
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    private func setupKeyboardDismissRecongnizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(mainTextField)
        addSubview(subtitleLabel)
        setupTitleLabelConstraints()
        setupMainTextFieldConstraints()
        setupSubtitleLabelConstraints()
    }
    
    private func setupSecondView() {
        addSubview(secondTitleLabel)
        addSubview(secondTextField)
        addSubview(secondSubtitleLabel)
        setupSecondTitleLabelConstraints()
        setupSecondTextFieldConstraints()
        setupSecondSubtitleLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 104),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupMainTextFieldConstraints() {
        NSLayoutConstraint.activate([
            mainTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            mainTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mainTextField.heightAnchor.constraint(equalToConstant: 50),
            mainTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupSecondTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            secondTitleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            secondTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            secondTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupSecondTextFieldConstraints() {
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 8),
            secondTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            secondTextField.heightAnchor.constraint(equalToConstant: 50),
            secondTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupSecondSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            secondSubtitleLabel.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 8),
            secondSubtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            secondSubtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
