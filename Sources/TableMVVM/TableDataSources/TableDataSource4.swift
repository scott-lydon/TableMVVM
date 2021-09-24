//
//  TableDataSource4.swift
//  TableViewWork
//
//  Created by Scott Lydon on 9/11/21.
//

import UIKit

public class TableDataSource4<
    Section0: PrimaryTableSectionMethods,
    Section1: PrimaryTableSectionMethods,
    Section2: PrimaryTableSectionMethods,
    Section3: PrimaryTableSectionMethods
>: TableDataSourceAndDelegate, HasFallBack
where Section0: HasFallBack,
      Section1: HasFallBack,
      Section2: HasFallBack,
      Section3: HasFallBack {
    
    public static var fallBack: Self { .init() }
    
    public var table: UITableView?
    
    public required init(
        section0: Section0 = .fallBack,
        section1: Section1 = .fallBack,
        section2: Section2 = .fallBack,
        section3: Section3 = .fallBack
    ) {
        self.section0 = section0
        self.section1 = section1
        self.section2 = section2
        self.section3 = section3
    }
    
    var queue: DispatchQueueType = DispatchQueue.main
    
    var section0: Section0 = .fallBack {
        didSet { self.table?.reload(on: queue) }
    }
    var section1: Section1 = .fallBack {
        didSet { self.table?.reload(on: queue) }
    }
    var section2: Section2 = .fallBack {
        didSet { self.table?.reload(on: queue) }
    }
    var section3: Section3 = .fallBack {
        didSet { self.table?.reload(on: queue) }
    }
    
    public var registerCandidates: [RegistersCells & RegistersHeader] {
        [section0, section1, section2, section3]
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int { 4 }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: return section0.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
        case 1: return section1.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
        case 2: return section2.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
        case 3: return section3.tableViewDidSelectRowAt(tableView, didSelectRowAt: indexPath)
        default: do {}
        }
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0: return section0.tableViewViewForHeader(tableView)
        case 1: return section1.tableViewViewForHeader(tableView)
        case 2: return section2.tableViewViewForHeader(tableView)
        case 3: return section3.tableViewViewForHeader(tableView)
        default: return nil
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return section0.tableViewHeightForHeaderInSection(tableView)
        case 1: return section1.tableViewHeightForHeaderInSection(tableView)
        case 2: return section2.tableViewHeightForHeaderInSection(tableView)
        case 3: return section3.tableViewHeightForHeaderInSection(tableView)
        default: return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return section0.tableViewNumberOfRows(tableView)
        case 1: return section1.tableViewNumberOfRows(tableView)
        case 2: return section2.tableViewNumberOfRows(tableView)
        case 3: return section3.tableViewNumberOfRows(tableView)
        default: return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return section0.tableView(tableView, cellForRowAt: indexPath)
        case 1: return section1.tableView(tableView, cellForRowAt: indexPath)
        case 2: return section2.tableView(tableView, cellForRowAt: indexPath)
        case 3: return section3.tableView(tableView, cellForRowAt: indexPath)
        default: return .init()
        }
    }
}
