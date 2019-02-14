import Foundation

struct Feature : Codable {
    let type : String?
    let properties : Properties?
    let geometry : Geometry?
    let id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case properties = "properties"
        case geometry = "geometry"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        properties = try values.decodeIfPresent(Properties.self, forKey: .properties)
        geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}
