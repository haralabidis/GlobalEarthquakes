import Foundation

struct Geometry : Codable {
    let type : String?
    let coordinates : [Double]?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case coordinates = "coordinates"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        coordinates = try values.decodeIfPresent([Double].self, forKey: .coordinates)
    }
    
}
