import Foundation

struct Metadata : Codable {
    let generated : Int?
    let url : String?
    let title : String?
    let status : Int?
    let api : String?
    let count : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case generated = "generated"
        case url = "url"
        case title = "title"
        case status = "status"
        case api = "api"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        generated = try values.decodeIfPresent(Int.self, forKey: .generated)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        api = try values.decodeIfPresent(String.self, forKey: .api)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
    
}
