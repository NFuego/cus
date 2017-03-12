//
//  ContactsViewController.swift
//  Project: momoCustomer
//
//  Module: Contacts
//
//  By ssstand 2017/3/12
//  MomoDidi 2017年
//

// MARK: Imports

import UIKit

import SwiftyVIPER


// MARK: Protocols

/// Should be conformed to by the `ContactsInteractor` and referenced by `ContactsPresenter`
protocol ContactsPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}


// MARK: -

/// The View Controller for the Contacts module
class ContactsViewController: UIViewController {

	// MARK: - Constants

	let presenter: ContactsViewPresenterProtocol

	// MARK: Variables

	// MARK: Inits

	init(presenter: ContactsViewPresenterProtocol) {
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

        self.title = "聯絡人"
		view.backgroundColor = .white
    }
}


// MARK: - Contacts Presenter to View Protocol

extension ContactsViewController: ContactsPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
