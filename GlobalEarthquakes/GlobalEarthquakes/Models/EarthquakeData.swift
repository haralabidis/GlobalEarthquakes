import Foundation

class EarthquakeData {
    static let shared = EarthquakeData()
    
    public var data: [Earthquake] = []
    
    private init() {
    }
    
    public func updateData(earthquakeDetails: EarthquakeDetails) {
        var earthquakeViewModelData: [Earthquake] = []
        
        guard let featuresArray = earthquakeDetails.features else {
            return
        }
        
        for feature in featuresArray {
            let magnitude = feature.properties?.mag ?? 0.0
            let place = feature.properties?.place ?? "unknown"
            let defaultDate = Int(NSDate().timeIntervalSince1970)
            let time = timeStringFromUnixTime(unixTime: feature.properties?.time ?? defaultDate, dateFormat: "hh:mm a")
            let date = timeStringFromUnixTime(unixTime: feature.properties?.updated ?? defaultDate, dateFormat: "dd-MMM-hh:mm a")
            let title = feature.properties?.title ?? "unknown"
            //Do not generate if no valid coordinates are in place
            guard let latitude =  feature.geometry?.coordinates?[1], let longitude = feature.geometry?.coordinates?[0] else { return }
            
            let earthquake = Earthquake.init(magnitude: magnitude, place: place, time: time, date: date, title: title, latitude: latitude, longitude: longitude)
            earthquakeViewModelData.append(earthquake)
        }
        
        self.data = earthquakeViewModelData
    }
    
    func timeStringFromUnixTime(unixTime: Int, dateFormat: String) -> String {
        let timeInterval = TimeInterval(unixTime)
        let date = Date(timeIntervalSince1970: (timeInterval / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date as Date)
    }
    
}
