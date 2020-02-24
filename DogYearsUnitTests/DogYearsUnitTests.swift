//
//  DogYearsUnitTests.swift
//  DogYearsUnitTests
//
//  Created by zmobile on 10/01/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsUnitTests: XCTestCase {

    let calc = Calculator()
    var recData:Data? = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    

    //:Code Coverage
    
    func testSettingScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        XCTAssertNotNil(storyboard, "Coud not instiate storyboard for seeting view creation")
        let vc = storyboard.instantiateViewController(identifier: "SettingsView") as? SettingsViewController
        XCTAssertNotNil(vc, "Coud not instiate VC for seeting view ")
        
        //Still The Code Coverage Is Zero Percent B/S We VC Instance is not used
        _ = vc?.view
    }
    
    //: Code Coverage
    func testMenuFailing() {
        var menu = Menu()
        menu.loadMenu(path: "Dummy.plist")
        let count = menu.count
        XCTAssert(count == 0 , "Menu loded menu item for not existing file")
    }
    
    func testAdd() {
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add Operation failed")
    }
    
    func testSubtract() {
        let result = calc.evaluate(op: "_", arg1: 9.0, arg2: 2.0)
        XCTAssert(result == 7.0, "Calculator subtract Operation failed")
    }

    func testResult() {
        let result1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        let result2 = calc.result
        XCTAssert(result1 == result2, "Calculator displayed result does not match calculation result")
    }
    
//    func testClear() {
//           let result1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
//           let result2 = calc.result
//           XCTAssert(result1 == result2, "Calculator displayed result in clear operation test")
//        calc.clear()
//        let result3 = calc.result
//        XCTAssert(result2 != result3 && result3 == 0, "Calculator clear operation is failed")
//       }
    
    func testClear() {
     calc.clear()
     let result = calc.result
     XCTAssert(result == 0, "Calculator clear operation is failed")
    }
    
    //NOT A GOOD APPROCH
//    func testInfoLoading () {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        XCTAssertNotNil(sb,"No Storyboard Found")
//
//        guard let vc = sb.instantiateViewController(identifier: "InformationView") as? InfoViewController else {
//            XCTAssert(false, "No View Controller instance found")
//            return
//        }
//
//        _ = vc.view
//
//        guard let txt = vc.txtInfo.text else {
//            XCTAssert(false, "could not get inetial text content on InfoViewController ")
//            return
//        }
//
//        vc.loadContent()
//
//        let pred = NSPredicate(format: "text != %@", txt)
//        let exp = expectation(for: pred, evaluatedWith: vc.txtInfo, handler: nil)
//        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
//
//        let txt2 = vc.txtInfo.text
//        XCTAssert(result == XCTWaiter.Result.completed, "Since text is not changed")
//    }
    
    
    //THIS ALSO NOT A GOOD APPROCH
//     func testInfoLoading () {
//            let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
//            HTTPClient.shared.get(url: url) { (data, error) in
//                self.recData = data
//                XCTAssertNil(error,"There is an error to loading content")
//                XCTAssertNotNil(data,"No data recive from the server")
//            }
//        }
    
//    func testInfoLoading () {
//        let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
//        HTTPClient.shared.get(url: url) { (data, error) in
//            self.recData = data
//        }
//        let pred = NSPredicate(format: "recData != nil")
//        let expec = expectation(for: pred, evaluatedWith: self, handler: nil)
//        let res = XCTWaiter.wait(for: [expec], timeout: 5.0)
//        if res == XCTWaiter.Result.completed {
//            XCTAssertNotNil(recData,"No Data Foud In recData From API")
//        }else {
//            XCTAssert(false,"Handle other api error")
//        }
//    }
    
    
    func testInfoLoading () {
        let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
        let session = MockSession()
        let client = HTTPClient(session: session)
        client.get(url: url) { (data, error) in
            self.recData = data
        }
        let pred = NSPredicate(format: "recData != nil")
        let expec = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [expec], timeout: 5.0)
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(recData,"No Data Foud In recData From API")
        }else {
            XCTAssert(false,"Handle other api error")
        }
    }

}
