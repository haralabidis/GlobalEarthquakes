import Foundation
import UIKit
import CoreLocation

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleGetStartedButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func styleGetStartedButton() {
        getStartedButton.backgroundColor = .clear
        getStartedButton.layer.cornerRadius = 5
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.borderColor = UIColor.white.cgColor
    }
    

    @IBAction func getStartedTapped(_ sender: Any) {
        navigateToEarthquakeList()
    }
    
    private func navigateToEarthquakeList() {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.viewControllers?.remove(at: 0)
        self.tabBarController?.selectedIndex = 0
    }
    
}
