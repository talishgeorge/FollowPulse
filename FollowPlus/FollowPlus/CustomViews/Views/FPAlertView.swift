import UIKit

class FPAlertVC: UIViewController {
    
    let titleLabel: UILabel
    let messageLabel: UILabel
    let actionButton: UIButton
    
    init(title: String, message: String, buttonTitle: String) {
        self.titleLabel = UILabel()
        self.titleLabel.text = title
        
        self.messageLabel = UILabel()
        self.messageLabel.text = message
        
        self.actionButton = UIButton(type: .system)
        self.actionButton.setTitle(buttonTitle, for: .normal)
        
        super.init(nibName: nil, bundle: nil)
        
        self.actionButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // ... rest of your class implementation ...
}
