//
//  CustomerDayViewController.swift
//  Project: momoCustomer
//
//  Module: CustomerDay
//
//  By ssstand 2017/3/12
//  MomoDidi 2017年
//

// MARK: Imports

import UIKit

import SwiftyVIPER


// MARK: Protocols

/// Should be conformed to by the `CustomerDayInteractor` and referenced by `CustomerDayPresenter`
protocol CustomerDayPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}


// MARK: -

/// The View Controller for the CustomerDay module
class CustomerDayViewController: UIViewController {

	// MARK: - Constants

	let presenter: CustomerDayViewPresenterProtocol


	// MARK: Variables


	// MARK: Inits

	init(presenter: CustomerDayViewPresenterProtocol) {
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


// MARK: - CustomerDay Presenter to View Protocol

extension CustomerDayViewController: CustomerDayPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
