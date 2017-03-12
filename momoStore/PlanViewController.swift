//
//  PlanViewController.swift
//  Project: momoCustomer
//
//  Module: Plan
//
//  By ssstand 2017/3/12
//  MomoDidi 2017年
//

// MARK: Imports

import UIKit

import SwiftyVIPER


// MARK: Protocols

/// Should be conformed to by the `PlanInteractor` and referenced by `PlanPresenter`
protocol PlanPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}


// MARK: -

/// The View Controller for the Plan module
class PlanViewController: UIViewController {

	// MARK: - Constants

	let presenter: PlanViewPresenterProtocol


	// MARK: Variables


	// MARK: Inits

	init(presenter: PlanViewPresenterProtocol) {
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

        self.title = "預約"
		view.backgroundColor = .white
    }
}


// MARK: - Plan Presenter to View Protocol

extension PlanViewController: PlanPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
