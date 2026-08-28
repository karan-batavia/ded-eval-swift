import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var screenTitle: UILabel!

    func bind(identity: Identity) {
        userName.text = identity.userName
        emailLabel.text = "Email"
        screenTitle.text = "Your profile"
    }
}
