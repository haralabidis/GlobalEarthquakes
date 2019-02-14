import Foundation

protocol EarthquakeServiceDelegate {
    func didRetrieveEarthquakeData()
    func didFailToRetrieveEarthquakeData(error: Error)
}

class EarthquakeService: NSObject {
    
    var delegate: EarthquakeServiceDelegate?
    let earthquakeAPIURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    
    func retrieveEarthquakeData() {
        guard let earthquakeAPIURL = earthquakeAPIURL else {return}

        let task = session.dataTask(with: earthquakeAPIURL) { (data, response, error) in
            if (error != nil) {
                self.delegate?.didFailToRetrieveEarthquakeData(error: error!)
                return
            }
            guard let data = data else {
                let error = AppError(locString: "No Data", reason: "Service did not return data", code: 0)
                self.delegate?.didFailToRetrieveEarthquakeData(error: error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let earthquakeDetails = try decoder.decode(EarthquakeDetails.self, from: data)
                EarthquakeData.shared.updateData(earthquakeDetails: earthquakeDetails)
                self.delegate?.didRetrieveEarthquakeData()
            } catch let error {
                self.delegate?.didFailToRetrieveEarthquakeData(error: error)
                return
            }
        }
        task.resume()
    }
    
}
