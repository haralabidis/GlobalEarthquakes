import Foundation
import UIKit

protocol EarthquakeTableViewControllerDelegate {
    func didSelectEarthquake(earhquake: Earthquake)
}

class EarthquakeTableViewController: UITableViewController, UITabBarControllerDelegate, EarthquakeDatasourceDelegate {

    @IBOutlet var noDataView: UIView!
    
    public var delegate: EarthquakeTableViewControllerDelegate?
    private let earhquakeDataSource = EarthquakeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControll()
        earhquakeDataSource.delegate = self
        tableView.dataSource = earhquakeDataSource
        tableView.delegate = self
        self.tabBarController?.delegate = self
        earhquakeDataSource.retrieveEarthquakeData()
    }
    
    @objc private func refreshEarthquakeData(_ sender: Any) {
        refreshEarthquakeData()
    }
    
    func setupRefreshControll() {
        guard let refreshControl = refreshControl else {return}
        refreshControl.addTarget(self, action: #selector(refreshEarthquakeData(_:)), for: .valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.8562252522, green: 0.2131633162, blue: 0.3274448514, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching earthquake Data ...", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Helvetica Neue", size: 15) as Any])
    }
    
    @objc func refreshEarthquakeData() {
         earhquakeDataSource.retrieveEarthquakeData()
    }

    //---------------------------------------
    // MARK: - TableviewDataSource Delegate
    //---------------------------------------
    
    func didUpdateEarthquakeData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            if (self.refreshControl?.isRefreshing)! {
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    func didFailToUpdateEarthquakeData(error: Error) {
        DispatchQueue.main.async {
            self.tableView.backgroundView = self.noDataView
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationController = self.tabBarController?.viewControllers?[1] else { return }
        let destinationNavigationController = navigationController as! UINavigationController
        let destinationViewController = destinationNavigationController.topViewController as! EarthquakeMapViewController
        destinationViewController.selectedAnnotationIndex = indexPath.row
        self.tabBarController?.selectedIndex = 1
    }
    
}
