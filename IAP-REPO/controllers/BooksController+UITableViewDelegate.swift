//
//  BooksController+UITableViewDelegate.swift
//  IAP-REPO
//
//  Created by Max Nelson on 5/30/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

extension BooksController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
