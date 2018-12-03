//
//  VFServiceCategoriesTableController.swift
//  MyVodafone
//
//  Created by Abuzeid Ibrahim on 12/3/18.
//  Copyright © 2018 TSSE. All rights reserved.
//

import UIKit

class VFServiceCategoriesTableController: UITableViewController {
    private var serviceCats = [VFServiceCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return serviceCats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cat_cell", for: indexPath)
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {}
}
