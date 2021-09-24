//
//  ComposesHeader.swift
//  TableViewWork
//
//  Created by Scott Lydon on 9/12/21.
//

import UIKit

/// Could be used for alternating headers as the public protocol.
/// inherited by: `SectionWithRowsHeader`
public protocol ComposesHeader: PrimaryHeaderMethods {
    associatedtype ComposedHeader: PrimaryHeaderMethods
    var header: ComposedHeader { get }
}

extension ComposesHeader {
    
    public func tableViewViewForHeader(_ tableView: UITableView) -> UIView? {
        header.tableViewViewForHeader(tableView)
    }
    
    public func tableViewHeightForHeaderInSection(_ tableView: UITableView) -> CGFloat {
        header.tableViewHeightForHeaderInSection(tableView)
    }
}

extension ComposesHeader where ComposedHeader: RegistersHeader {
    
    public func registerHeader(tableView: UITableView) {
        header.registerHeader(tableView: tableView)
    }
}
