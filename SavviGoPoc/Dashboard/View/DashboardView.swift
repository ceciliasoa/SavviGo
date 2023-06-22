//
//  DashboardView.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 25/05/23.
//

import UIKit

class DashboardView: UITableViewCell, Identifiable {
    
    var objectiveLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 24, weight: .heavy)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goalLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var savedLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(size: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(objectiveLabel)
        addSubview(valueLabel)
        addSubview(goalLabel)
        addSubview(savedLabel)
        setupObjectiveLabelConstraints()
        setupValueLabelConstraints()
        setupGoalLabelConstraints()
        setupSavedLabelConstraints()
    }
    
 
    
    private func setupObjectiveLabelConstraints() {
        NSLayoutConstraint.activate([
            objectiveLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            objectiveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            objectiveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
  
    private func setupValueLabelConstraints() {
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: objectiveLabel.bottomAnchor, constant: 8),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupGoalLabelConstraints() {
        NSLayoutConstraint.activate([
            goalLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 8),
            goalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            goalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupSavedLabelConstraints() {
        NSLayoutConstraint.activate([
            savedLabel.topAnchor.constraint(equalTo: goalLabel.bottomAnchor, constant: 8),
            savedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            savedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
