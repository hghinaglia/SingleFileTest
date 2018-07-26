//
//  HomeView.swift
//  SingleFile
//
//  Created by Hector Ghinaglia on 7/26/18.
//  Copyright © 2018 HG. All rights reserved.
//

import UIKit

class HomeView: UIView {

    weak var tableView: UITableView!
    weak var buttonContainerView: UIView!
    weak var button: UIButton!

    private var bottomConstraint: NSLayoutConstraint?

    init() {
        super.init(frame: .zero)

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        addSubview(tableView)
        self.tableView = tableView

        let buttonContainerView = UIView()
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        addSubview(buttonContainerView)
        self.buttonContainerView = buttonContainerView

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1.0 / UIScreen.main.scale
        buttonContainerView.addSubview(button)
        self.button = button

        configureLayoutConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if #available(iOS 11.0, *) {
            bottomConstraint?.constant = -(safeAreaInsets.bottom + 15)
        }
    }

    // MARK: - Layout

    private func configureLayoutConstraints() {
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: buttonContainerView.topAnchor).isActive = true

        buttonContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        buttonContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true

        button.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor, constant: 15).isActive = true
        button.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor, constant: -15).isActive = true
        button.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: 15).isActive = true
        bottomConstraint = button.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: -15)
        bottomConstraint?.isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
