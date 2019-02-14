import Foundation

struct EarthquakeDetails : Codable {
    let type : String?
    let metadata : Metadata?
    let features : [Feature]?
    let bbox : [Double]?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case metadata = "metadata"
        case features = "features"
        case bbox = "bbox"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        metadata = try values.decodeIfPresent(Metadata.self, forKey: .metadata)
        features = try values.decodeIfPresent([Feature].self, forKey: .features)
        bbox = try values.decodeIfPresent([Double].self, forKey: .bbox)
    }
}



