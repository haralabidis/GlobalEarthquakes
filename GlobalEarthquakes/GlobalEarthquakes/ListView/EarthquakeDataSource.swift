import Foundation
import UIKit

protocol EarthquakeDatasourceDelegate {
    func didUpdateEarthquakeData()
    func didFailToUpdateEarthquakeData(error: Error)
}

class EarthquakeDataSource: NSObject, UITableViewDataSource, EarthquakeServiceDelegate {

    var delegate: EarthquakeDatasourceDelegate?
    var earthquakeData: Array<Earthquake> = []
    let session = URLSession.shared
    var earthquakeService: EarthquakeService?
    
    override init() {
        super.init()
        earthquakeService = EarthquakeService(session: session)
        earthquakeService?.delegate = self
    }
    
    //---------------------------------------
    // MARK: - TableviewDataSource Delegate
    //---------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "earthquakeListTableViewCell", for: indexPath) as! EarthquakeTableViewCell
        let earthquake = earthquakeData[indexPath.row]
        cell.configureWithEarthquake(earthquake: earthquake)
        
        return cell
    }
    
    //---------------------------------------
    // MARK: - Data retrieval
    //---------------------------------------
    
    public func retrieveEarthquakeData() {
        if EarthquakeData.shared.data.count == 0 {
            earthquakeService?.retrieveEarthquakeData()
        } else {
            self.earthquakeData = EarthquakeData.shared.data
            self.delegate?.didUpdateEarthquakeData()
        }
    }
    
    func reloadData() {
        earthquakeService?.retrieveEarthquakeData()
    }
    
    //------------------------------------
    // MARK: - EarthquakeService Delegate
    //------------------------------------

    
    func didRetrieveEarthquakeData() {
        self.earthquakeData = EarthquakeData.shared.data
        self.delegate?.didUpdateEarthquakeData()
    }
    
    func didFailToRetrieveEarthquakeData(error: Error) {
        self.delegate?.didFailToUpdateEarthquakeData(error: error)
    }

    
}
