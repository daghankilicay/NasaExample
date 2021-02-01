//
//  NasaExampleUITests.swift
//  NasaExampleUITests
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import XCTest

class NasaExampleUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let collectionView = app.collectionViews
        let firstChild = collectionView.children(matching:.any).element(boundBy: 0)
        app.launch()
        sleep(2)

        app.buttons["Spirit"].tap()
        sleep(1)

        app.buttons["Opportunity"].tap()
        sleep(1)

        app.buttons["Curiosity"].tap()
        sleep(1)

        if firstChild.exists {
             firstChild.tap()
        }
        sleep(2)
        
        app.buttons.element(boundBy: 0).tap()
        sleep(1)
        
        app.buttons["Filter"].tap()
        sleep(1)
        
        app.buttons["Cancel"].tap()
        sleep(1)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
