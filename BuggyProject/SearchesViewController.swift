//
//  SearchesViewController.swift
//  BuggyProject
//
//  Created by Benjamin Wu on 1/6/16.
//  Copyright © 2016 IntrepidPursuits. All rights reserved.
//

import UIKit

class SearchesViewController: UIViewController, UITableViewDataSource {

    static let cellIdentifier = "cellIdentifier"
    let searches: [String]
    @IBOutlet var tableView: UITableView!

    init(searches: [String]) {
        self.searches = searches
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.searches = []
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: SearchesViewController.cellIdentifier)
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchesViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.text = searches[indexPath.row]
        return cell
    }

    @IBAction func doneTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
