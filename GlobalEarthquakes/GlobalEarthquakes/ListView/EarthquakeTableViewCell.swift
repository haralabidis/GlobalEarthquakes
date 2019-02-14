import UIKit

class EarthquakeTableViewCell: UITableViewCell {

    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    private var earthquake: Earthquake?
    
    func configureWithEarthquake(earthquake: Earthquake) {
        self.earthquake = earthquake
        
        self.magnitudeLabel.text = String(format:"%.1f", earthquake.magnitude)
        self.locationLabel.text = earthquake.place
        self.timeLabel.text = earthquake.time
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func clearCell() {
        self.magnitudeLabel.text = "00"
        self.locationLabel.text = "loading..."
        self.timeLabel.text = "00:00am"
    }
}
