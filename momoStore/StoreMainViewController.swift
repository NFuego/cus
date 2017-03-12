

// MARK: Imports

import UIKit
import SnapKit
import SwiftyVIPER
import RxSwift
import RxCocoa


// MARK: Protocols

/// Should be conformed to by the `StoreMainInteractor` and referenced by `StoreMainPresenter`
protocol StoreMainPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}


// MARK: -

/// The View Controller for the StoreMain module
class StoreMainViewController: UIViewController {

	// MARK: - Constants

	let presenter: StoreMainViewPresenterProtocol
    let appointBtn = UIButton()
//    var monthNav:UINavigationController!
    let monthVC = AppointStoreMonthModule().view

	// MARK: Variables
    let dbg = DisposeBag()


	// MARK: Inits

	init(presenter: StoreMainViewPresenterProtocol) {
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
//        monthNav = UINavigationController(rootViewController: monthVC)

		view.backgroundColor = .white
        setup()
    }
}

// MARK: - StoreMain UI helper

extension StoreMainViewController{
    func setup(){
        self.view.addSubview(appointBtn)
       appointBtn.setTitle("預約", for: .normal)
        appointBtn.rx.tap.subscribe(onNext: { (event) in
            print(event)
            MDApp.store.initVC?.pushViewController(self.monthVC, animated: true)
        }).addDisposableTo(dbg)
        self.appointBtn.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(45)
        }
    }
    
   func preSet() {
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.barCr
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "商家"
        let back = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(self.back))
        self.navigationItem.leftBarButtonItem = back
    }

    func back(){
        self.dismiss(animated: true) { 

        }
    }
}


// MARK: - StoreMain Presenter to View Protocol

extension StoreMainViewController: StoreMainPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
