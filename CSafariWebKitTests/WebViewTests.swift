//
//  WebViewTests.swift
//  CSafariWebKitTests
//
//  Created by Douglas Mandarino on 21/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import XCTest
import SafariServices
@testable import CSafariWebKit

class WebViewTests: XCTestCase {
    
    var urlToTest: URL!
    
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
    
    func testLoadSafariViewController() {
        let vc = WebViewMock.safari.load(url: urlToTest)
        XCTAssertTrue(vc.isKind(of: UIViewController.self))
    }
    
    func testPresentSafariViewController() {
        let safari = WebViewMock.safari
        safari.present(url: urlToTest, from: UIViewController())
        safari.present(url: urlToTest, from: UIViewController(), whenDidClose: nil)
        safari.present(url: urlToTest, from: UIViewController(), dismissButtonStyle: .done, whenDidClose: nil)
        safari.present(url: urlToTest, from: UIViewController(), dismissButtonStyle: .done, barTintColor: .blue, tintColor: .white, whenDidClose: nil)
        safari.present(url: urlToTest, from: UIViewController(), dismissButtonStyle: .done, presentModally: false, barCollapsingEnabled: false, entersReaderIfAvailable: false, barTintColor: .blue, tintColor: .white, whenDidClose: nil)
    }
    
    func testLoadWKWebViewController() {
        let vc = WebViewMock.wkWebView.load(url: urlToTest)
        XCTAssertTrue(vc.isKind(of: UIViewController.self))
    }
    
    func testPresentWKWebViewController() {
        let webview = WebViewMock.wkWebView
        webview.present(url: urlToTest, from: UIViewController())
        webview.present(url: urlToTest, from: UIViewController(), whenDidClose: nil)
        webview.present(url: urlToTest, from: UIViewController(), closeButtonName: "Done",
                        buttonSide: .left, barTintColor: .blue, tintColor: .white, whenDidClose: nil)
        webview.present(url: urlToTest, from: UIViewController(), closeButtonName: "Done",
                        buttonSide: .left, barTintColor: .blue, tintColor: .white,
                        title: "", whenDidClose: nil)
        webview.present(url: urlToTest, from: UIViewController(), closeButtonName: "Done",
                        buttonSide: .left, barTintColor: .blue, tintColor: .white,
                        title: "My WebView", userAgent: "", didClose: nil)
    }
}

private class WebViewMock: WebViewProtocol {
    
    static var wkWebView: WebViewControllerProtocol {
        get {
            return WebViewControllerMock()
        }
    }
    static var safari: SafariViewControllerProtocol  {
        get {
            return SafariViewControllerMock()
        }
    }
}

private class SafariViewControllerMock: SafariViewControllerProtocol {
    
    private let expect: XCTestExpectation = XCTestExpectation()

    func load(url: URL) -> UIViewController {
        expect.fulfill()
        return UIViewController()
    }
    
    func present(url: URL, from previousViewController: UIViewController) {
        expect.fulfill()
    }
    
    func present(url: URL, from previousViewController: UIViewController,
                 whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }
    
    func present(url: URL, from previousViewController: UIViewController,
                 dismissButtonStyle: DismissButtonStyle, whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }
    
    func present(url: URL, from previousViewController: UIViewController,
                 dismissButtonStyle: DismissButtonStyle, barTintColor: UIColor?,
                 tintColor: UIColor?, whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }
    
    func present(url: URL, from previousViewController: UIViewController,
                 dismissButtonStyle: DismissButtonStyle, presentModally: Bool,
                 barCollapsingEnabled: Bool, entersReaderIfAvailable: Bool,
                 barTintColor: UIColor?, tintColor: UIColor?,
                 whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }
}

private class WebViewControllerMock: WebViewControllerProtocol {    
    
    private let expect: XCTestExpectation = XCTestExpectation()
    
    func load(url: URL) -> UIViewController {
        expect.fulfill()
        return UIViewController()
    }

    func present(url: URL, from previousViewController: UIViewController) {
        expect.fulfill()
    }

    func present(url: URL, from previousViewController: UIViewController,
                 whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }

    func present(url: URL, from previousViewController: UIViewController,
                 closeButtonName: String?, buttonSide: ButtonSide, barTintColor: UIColor?,
                 tintColor: UIColor?, whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }

    func present(url: URL, from previousViewController: UIViewController,
                 closeButtonName: String?, buttonSide: ButtonSide,
                 barTintColor: UIColor?, tintColor: UIColor?, title: String?,
                 whenDidClose didClose: (() -> Void)?) {
        expect.fulfill()
    }

    func present(url: URL, from previousViewController: UIViewController,
                 closeButtonName: String?, buttonSide: ButtonSide, barTintColor: UIColor?,
                 tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        expect.fulfill()
    }
}
