import UIKit
import MapKit

class EarthquakeMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var earthquakeData: Array<Earthquake> = []
    var selectedAnnotationIndex: Int?
    var selectedAnnotation: MapAnnotation?
    private var mapAnnotations: [MapAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.earthquakeData = EarthquakeData.shared.data
        mapView.delegate = self
        configureMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectAnnotation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deSelectAnnotation()
    }
    
    private func configureMapView() {
        mapView.register(MapMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        if earthquakeData.count > 0 {
            for earthquake: Earthquake in earthquakeData {
                    let mapAnnotation = MapAnnotation(earthquake: earthquake)
                    mapAnnotations.append(mapAnnotation)
                }
        }
        mapView.addAnnotations(mapAnnotations)
    }
    
    //------------------------------------
    // MARK: - Annotation Selection
    //------------------------------------
    
    
    func selectAnnotation() {
        guard let selectedAnnotationIndex = selectedAnnotationIndex else {return}
        let selectedEarthquake = earthquakeData[selectedAnnotationIndex]
        guard let selectedAnnotation = mapAnnotations.first(where: { $0.coordinate.latitude == selectedEarthquake.latitude &&  $0.coordinate.longitude == selectedEarthquake.longitude}) else { return }
        self.selectedAnnotation = selectedAnnotation
        self.mapView.selectAnnotation(selectedAnnotation, animated: true)
        centerMapOnLocation(location: (selectedAnnotation.coordinate), regionRadius: 1000)
        
    }
    
    func deSelectAnnotation() {
        selectedAnnotationIndex = nil
        guard let selectedAnnotation = selectedAnnotation else { return }
        self.mapView.deselectAnnotation(selectedAnnotation, animated: true)
        centerMapOnLocation(location: selectedAnnotation.coordinate, regionRadius: 1000000)
    }
    
    //------------------------------------
    // MARK: - Focus the map on location
    //------------------------------------
    private func centerMapOnLocation(location: CLLocationCoordinate2D, regionRadius: CLLocationDistance) {
        let clLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let coordinateRegion = MKCoordinateRegion(center: clLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
