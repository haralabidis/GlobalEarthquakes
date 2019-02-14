import Foundation

class Earthquake: NSObject {
    let magnitude: Double
    let place: String
    let time : String
    let date: String
    let title: String
    let latitude: Double
    let longitude: Double
    
    init(magnitude: Double, place: String, time : String, date: String, title: String, latitude: Double, longitude: Double ){
        self.magnitude = magnitude
        self.place = place
        self.time = time
        self.date = date
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
}
