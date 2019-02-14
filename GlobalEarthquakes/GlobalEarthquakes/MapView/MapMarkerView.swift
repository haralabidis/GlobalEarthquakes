import Foundation
import MapKit

class MapMarkerView: MKAnnotationView {    
    override var annotation: MKAnnotation? {
        willSet {
            guard let mapAnnotation = newValue as? MapAnnotation else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            image = UIImage(named: "mapAnnotation")
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(15)
            detailLabel.text = mapAnnotation.locationName
            detailLabel.accessibilityIdentifier = "caloutdetailLabel"
            detailCalloutAccessoryView = detailLabel
            
            self.accessibilityIdentifier = "applicationPin"
            
        }
    }
}
