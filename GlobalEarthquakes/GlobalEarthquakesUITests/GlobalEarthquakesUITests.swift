import XCTest

class GlobalEarthquakesUITests: XCTestCase {
    
    private var application: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationToListView() {

        let getStartedButton = application.buttons["Get started"]
        let listViewTabBar = application.tabBars.buttons["List"]
        
        getStartedButton.tap()
        
        XCTAssertNotNil(listViewTabBar)

    }
    
    func testNavigationToMapView() {
        let getStartedButton = application.buttons["Get started"]
        let mapViewTabBar = application.tabBars.buttons["Map"]
        let map = application.maps.containing(.other, identifier:"Australia").element
        
        getStartedButton.tap()
        application.tables.cells.element(boundBy: 0).tap()
        
        XCTAssertNotNil(mapViewTabBar)
        XCTAssertNotNil(map)
    }
    
    func testPinExistsOnMap() {
        let getStartedButton = application.buttons["Get started"]
        let pin = application.otherElements.matching(identifier: "applicationPin").element(boundBy: 0)
        
        getStartedButton.tap()
        application.tables.cells.element(boundBy: 0).tap()
        XCTAssertTrue(pin.exists)
    }

}
