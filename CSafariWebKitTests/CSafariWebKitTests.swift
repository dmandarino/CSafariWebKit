//
//  CSafariWebKitTests.swift
//  CSafariWebKitTests
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import XCTest
import SafariServices
@testable import CSafariWebKit

class CSafariWebKitTests: XCTestCase {
    
    var expect: XCTestExpectation!
    var urlToTest: URL!
    var sut: SafariViewController!
    
    override func setUp() {
        super.setUp()
        guard let url = URL(string: "https://github.com/dmandarino/CSafariWebKit") else {
            XCTFail()
            return
        }
        urlToTest = url
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToGuaranteeDefaultValues() {
        sut = SafariViewController(url: urlToTest, barTintColor: nil, tintColor: nil)
        XCTAssertEqual(sut.barCollapsingEnabled, false)
        XCTAssertEqual(sut.entersReaderIfAvailable, false)
        XCTAssertEqual(sut.presentModally, false)
        XCTAssertEqual(sut.dismissButtonStyle, .done)
    }
    
    func testCallBackWhenDidFinish() {
        let vc = UIViewController(nibName: nil, bundle: nil)
        let sfSafariVC = SFSafariViewController(url: urlToTest)
        sut = SafariViewController(url: urlToTest, barTintColor: nil, tintColor: nil,
                                   safariViewControllerMock: sfSafariVC)
        expect = expectation(description: "Callback when did finish SafariViewController")
        sut.presentSafari(fromViewController: vc, whenDidFinish: callbackFunction)
        sut.safariViewControllerDidFinish(sfSafariVC)
        wait(for: [expect], timeout: 2.0)
    }
    
    private func callbackFunction() {
        expect?.fulfill()
    }
}
