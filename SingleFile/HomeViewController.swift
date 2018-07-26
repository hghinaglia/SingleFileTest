//
//  HomeViewController.swift
//  SingleFile
//
//  Created by Hector Ghinaglia on 7/26/18.
//  Copyright © 2018 HG. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = { return HomeView() }()

    private var selectedLanguage: String?

    let languages: [String] = ["Swift", "Objective-C", "Java", "Kotlin", "C++"]

    // MARK: - Lifecycle

    override func loadView() {
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        homeView.button.addTarget(self, action: #selector(openLanguage(_:)), for: .touchUpInside)

        view = homeView

        updateView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Languages"
    }

    // MARK: - View

    private func updateView() {
        homeView.button.setTitle("Open " + (selectedLanguage ?? "..."), for: .normal)
    }

    // MARK: - Actions

    @objc func openLanguage(_ sender: UIButton) {
        let alert = UIAlertController(title: selectedLanguage, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedLanguage = languages[indexPath.row]
        updateView()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let language = languages[indexPath.row]
        cell.textLabel?.text = language
        return cell
    }
}

