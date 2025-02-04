//
//  TableMVVM.swift
//  TableViewWork
//
//  Created by Scott Lydon on 9/14/21.
//

import UIKit


 public class TableMVVM<ViewModel>: UITableView
where ViewModel: UITableViewDataSource,
      ViewModel: UITableViewDelegate,
      ViewModel: RegistersCells,
      ViewModel: RegistersHeader,
      ViewModel: HasTable {

    convenience init(
        presentationLogic: ((ViewModel?) -> ViewModel)? = nil,
        viewModel: ViewModel
    ) {
        self.init(frame: .zero)
        self.viewModel = viewModel
        self.viewModel?.set(table: self)
        self.presentationLogic = presentationLogic
        self.presentationViewModel = presentationLogic?(viewModel) ?? viewModel
        assert(presentationViewModel != nil)
        presentationViewModel?.registerCells(tableView: self)
        presentationViewModel?.registerHeader(tableView: self)
        delegate = presentationViewModel
        dataSource = presentationViewModel
        assert(delegate != nil)
        assert(dataSource != nil)
        DispatchQueue.main.async(execute: reloadData)
    }

    public typealias ViewModel = ViewModel

    var presentationLogic: ((ViewModel?) -> ViewModel)?

    var viewModel: ViewModel? {
        didSet {
            self.presentationViewModel = presentationLogic?(viewModel) ?? viewModel
        }
    }

    private(set) var presentationViewModel: ViewModel? {
        didSet {
            delegate = presentationViewModel
            dataSource = presentationViewModel
            presentationViewModel?.registerCells(tableView: self)
            presentationViewModel?.registerHeader(tableView: self)
            DispatchQueue.main.async(execute: reloadData)
        }
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }

    required init?(coder: NSCoder) {
        nil
    }
}
