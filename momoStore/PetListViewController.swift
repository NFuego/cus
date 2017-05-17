//
//  PetListViewController.swift
//  Project: momoCustomer
//
//  Module: PetList
//
//  By zcon 2017/5/17
//  MomoDidi 2017年
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `PetListInteractor` and referenced by `PetListPresenter`
protocol PetListPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The View Controller for the PetList module
class PetListViewController: UIViewController {

	// MARK: - Constants

	let presenter: PetListViewPresenterProtocol

	// MARK: Variables

	// MARK: Inits

	init(presenter: PetListViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()

		view.backgroundColor = .white
    }
}

// MARK: - PetList Presenter to View Protocol

extension PetListViewController: PetListPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
