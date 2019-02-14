import XCTest
@testable import GlobalEarthquakes

class GlobalEarthquakesTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
    }
    
    //-----------------------------------------
    // MARK: - EarthquakeData Tests
    //-----------------------------------------

    func testUpdateEarthquakeData() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "sample", ofType: "geojson")
        let promise = expectation(description: "Serialisation complete")
        var decoderError: Error?
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)

        let decoder = JSONDecoder()
        do {
            let earthquakeDetails = try decoder.decode(EarthquakeDetails.self, from: data!)
            EarthquakeData.shared.updateData(earthquakeDetails: earthquakeDetails)
            promise.fulfill()
        } catch let error {
            decoderError = error
        }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(decoderError)
        XCTAssert(EarthquakeData.shared.data.count > 0, "Succesfully parsed data")

    }
}
