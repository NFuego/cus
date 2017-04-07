
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

    // right btns
    var memoBtn = NavBarBtn(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
    var memoNav:UINavigationController!


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
        setupRightBtn()

    }
}

// MARK: - UI helper
extension ContactsViewController {
    func setupRightBtn(){
//        b.badgeCount = 1
        memoBtn.setTitle("行事曆", for: .normal)
        memoBtn.setTitleColor(.white, for: .normal)
//        memoBtn.setTitleColor(.black, for: .highlighted)
        memoBtn.addTarget(self, action: #selector(memoBtnHandle), for: .touchUpInside)
        
        let memo = UIBarButtonItem(customView: memoBtn )
        
//        record.target = self
//        record.action = #selector(self.recordBtnHandle)
        //        b.addSubview(badge)
        //        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: nil)
//        let appoint = UIBarButtonItem(title: "預約", style: .plain, target: self, action: nil)
//        appointmentsBtn.setTitle("預約", for: .normal)
//        appointmentsBtn.setTitleColor(.white, for: .normal)
//        appointmentsBtn.setTitleColor(.black, for: .highlighted)
//        appointmentsBtn.addTarget(self, action: #selector(appointBtnHandle), for: .touchUpInside)
        
//        let appoint = UIBarButtonItem(customView: appointmentsBtn)
//        appoint.target = self
//        appoint.action = #selector(self.appointBtnHandle)
        
//        appointmentsBtn.badgeCount = 100
        
        //        play.customView?.addSubview(badge)
        //        navigationItem.rightBarButtonItem = rightButton
        
        //        navigationItem.rightBarButtonItems = [rightButton,rightButton2]
        navigationItem.rightBarButtonItems = [memo]
    }
    
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

        memoNav = UINavigationController(rootViewController: MemoModule().view)
    }

    func memoBtnHandle(){
       self.navigationController?.present(memoNav, animated: true)
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
//        print(contact.displayName())
//        debugPrint(contact)
        contactShowView.contactInfo = contact
//        self.navigationController?.pushViewController(contactShowView, animated: true)
        self.navigationController?.pushViewController(MemoModule().view, animated: true)
    }

    func epContactPicker(_: EPContactsPicker, didSelectMultipleContacts contacts : [EPContact]){

    }
}
