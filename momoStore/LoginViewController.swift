// MARK: Imports
import UIKit
import SnapKit
import SwiftyVIPER

// MARK: Protocols
/// Should be conformed to by the `LoginInteractor` and referenced by `LoginPresenter`
protocol LoginPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The View Controller for the Login module
class LoginViewController: UIViewController {

	// MARK: - Constants

	let presenter: LoginViewPresenterProtocol

	// MARK: Variables

	// MARK: Inits

	init(presenter: LoginViewPresenterProtocol) {
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
        
        // bg
        let bg = UIImageView()
        bg.image = UIImage(named: imgRefBg)
        self.view.addSubview(bg)
        bg.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
        
        // 750 x 1334
        let headerRatio = 0.337331334332834
        // build ui
        let header = UIImageView()
        header.image = UIImage(named: imgRefLoginHeader)
        self.view.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalToSuperview().offset(21/2)
            make.height.equalToSuperview().multipliedBy(headerRatio)
        }
        
//        let lbAccontRatio = 0.502998500749625
        let lbAccount  = UILabel()
        lbAccount.text = "Account"
        lbAccount.textAlignment = .center
        self.view.addSubview(lbAccount)
        lbAccount.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerY.equalToSuperview() //.multipliedBy(lbAccontRatio)
        }
        
        // user name
        let tfHeight = 44
        let elmsHeightOffset = 7
        let tfName = UITextField()
        tfName.placeholder = "User Name"
        self.view.addSubview(tfName)
        tfName.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(tfHeight)
            make.centerX.equalTo(lbAccount)
            make.top.equalTo(lbAccount.snp.bottom).offset(elmsHeightOffset)
        }
        tfName.textAlignment = .center
        
        Styler.clearBorder(tfName)
        
        
        
    } // fin viewdid
}

// MARK: - Login Presenter to View Protocol

extension LoginViewController: LoginPresenterViewProtocol {

	func set(title: String?) {
		self.title = title
	}
}
