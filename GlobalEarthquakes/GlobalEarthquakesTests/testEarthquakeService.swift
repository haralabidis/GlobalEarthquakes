import XCTest
@testable import GlobalEarthquakes

class testEarthquakeService: XCTestCase  {
    var testURLSession: MockSession!
    var testLiveSession: URLSessionProtocol!
    var apiData: Data? = nil
    
    override func setUp() {
        testURLSession = MockSession()
        testLiveSession = URLSession.shared
    }
    
    override func tearDown() {
        testURLSession = nil
        testLiveSession = nil
    }
    
    //-----------------------------------------
    // MARK: - EarthquakeService Tests
    //-----------------------------------------
    
    func testMockCallToAPICompletes() {
        // given
        let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
        let promise = expectation(description: "Completion handler invoked")
        var responseError: Error?
        
        // when
        let dataTask = testURLSession.dataTask(with: url!) { data, response, error in
            //statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertNil(responseError)
    }
    
    func testRealCallToAPICompletes() {
        // given
        let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = testLiveSession.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
