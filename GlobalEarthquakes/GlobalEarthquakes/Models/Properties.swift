import Foundation

struct Properties : Codable {
    let mag : Double?
    let place : String?
    let time : Int?
    let updated : Int?
    let tz : Int?
    let url : String?
    let detail : String?
    let felt : Int?
    let cdi : Double?
    let mmi : Double?
    let alert : String?
    let status : String?
    let tsunami : Int?
    let sig : Int?
    let net : String?
    let code : String?
    let ids : String?
    let sources : String?
    let types : String?
    let nst : Int?
    let dmin : Double?
    let rms : Double?
    let gap : Double?
    let magType : String?
    let type : String?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case mag = "mag"
        case place = "place"
        case time = "time"
        case updated = "updated"
        case tz = "tz"
        case url = "url"
        case detail = "detail"
        case felt = "felt"
        case cdi = "cdi"
        case mmi = "mmi"
        case alert = "alert"
        case status = "status"
        case tsunami = "tsunami"
        case sig = "sig"
        case net = "net"
        case code = "code"
        case ids = "ids"
        case sources = "sources"
        case types = "types"
        case nst = "nst"
        case dmin = "dmin"
        case rms = "rms"
        case gap = "gap"
        case magType = "magType"
        case type = "type"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mag = try values.decodeIfPresent(Double.self, forKey: .mag)
        place = try values.decodeIfPresent(String.self, forKey: .place)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
        tz = try values.decodeIfPresent(Int.self, forKey: .tz)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        detail = try values.decodeIfPresent(String.self, forKey: .detail)
        felt = try values.decodeIfPresent(Int.self, forKey: .felt)
        cdi = try values.decodeIfPresent(Double.self, forKey: .cdi)
        mmi = try values.decodeIfPresent(Double.self, forKey: .mmi)
        alert = try values.decodeIfPresent(String.self, forKey: .alert)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tsunami = try values.decodeIfPresent(Int.self, forKey: .tsunami)
        sig = try values.decodeIfPresent(Int.self, forKey: .sig)
        net = try values.decodeIfPresent(String.self, forKey: .net)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        ids = try values.decodeIfPresent(String.self, forKey: .ids)
        sources = try values.decodeIfPresent(String.self, forKey: .sources)
        types = try values.decodeIfPresent(String.self, forKey: .types)
        nst = try values.decodeIfPresent(Int.self, forKey: .nst)
        dmin = try values.decodeIfPresent(Double.self, forKey: .dmin)
        rms = try values.decodeIfPresent(Double.self, forKey: .rms)
        gap = try values.decodeIfPresent(Double.self, forKey: .gap)
        magType = try values.decodeIfPresent(String.self, forKey: .magType)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}
