import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let time: String?
    var coordinate: CLLocationCoordinate2D
    
    init(earthquake: Earthquake) {
        let longitute = earthquake.longitude
        let latitute = earthquake.latitude
        self.title = earthquake.date
        self.locationName = earthquake.place
        self.time = earthquake.time
        self.coordinate = CLLocationCoordinate2D(latitude: latitute, longitude: longitute)

        super.init()
    }
    
    var subtitle: String? {
        return time
    }
    
}
