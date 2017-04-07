
// MARK: Imports

import UIKit

import SwiftyVIPER

import SnapKit

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
    let contactShowView = ContactViewModule().view
    var cp:EPContactsPicker!

	// MARK: Inits

	init(presenter: ContactsViewPresenterProtocol) {
		self.presenter = presenter
//        contactsNav = UINavigationController(rootViewController: cp)
        
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
        setup()
        
    }
}

// MARK: - UI helper
extension ContactsViewController {
    func setup(){
       self.edgesForExtendedLayout = []
       self.extendedLayoutIncludesOpaqueBars = true
       self.navigationController?.toolbar.barStyle = .default // this make it appears
        
       self.navigationController?.navigationBar.barStyle = .blackOpaque
       self.navigationController?.navigationBar.isTranslucent = false
       self.navigationController?.navigationBar.barTintColor = UIColor(hex: "FF4081")
       self.navigationController?.navigationBar.tintColor = .white

       self.cp = EPContactsPicker(delegate: self, multiSelection:false, subtitleCellType: SubtitleCellValue.phoneNumber)
       self.view.addSubview(cp.view)
    }
    
}


// MARK: - Contacts Presenter to View Protocol

extension ContactsViewController: ContactsPresenterViewProtocol {
	func set(title: String?) {
		self.title = title
	}
}

extension ContactsViewController: EPPickerDelegate {
    func epContactPicker(_: EPContactsPicker, didContactFetchFailed error : NSError) {

    }
    
    func epContactPicker(_: EPContactsPicker, didCancel error : NSError){

    }
    
    func epContactPicker(_: EPContactsPicker, didSelectContact contact : EPContact){
        print(contact.displayName())
        debugPrint(contact)
        contactShowView.contactInfo = contact
        self.navigationController?.pushViewController(contactShowView, animated: true)
    }

    func epContactPicker(_: EPContactsPicker, didSelectMultipleContacts contacts : [EPContact]){

    }
}
