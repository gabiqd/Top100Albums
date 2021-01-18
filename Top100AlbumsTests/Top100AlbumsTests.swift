//
//  Top100AlbumsTests.swift
//  Top100AlbumsTests
//
//  Created by Gabriel on 15/01/2021.
//  Copyright © 2021 Gabriel Quispe Delgadillo. All rights reserved.
//

import XCTest
@testable import Top100Albums

class MockImageService: ImageService {
    let image = UIImage()
    
    func fetchImage(imageURL url: URL, completition: @escaping (Result<UIImage, NetworkError>) -> Void) {
        completition(.success(image))
    }
}

class Top100AlbumsTests: XCTestCase {
    let sampleData = "{\"artistName\":\"Morgan Wallen\",\"id\":\"1540314609\",\"releaseDate\":\"2021-01-08\",\"name\":\"Dangerous: The Double Album\",\"kind\":\"album\",\"copyright\":\"℗ 2020 Big Loud Records, under exclusive license to Republic Records, A division of UMG Recordings, Inc.\",\"artistId\":\"829142092\",\"contentAdvisoryRating\":\"Explicit\",\"artistUrl\":\"https://music.apple.com/us/artist/morgan-wallen/829142092?app=music\",\"artworkUrl100\":\"https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/4d/ac/86/4dac8685-540c-8401-ff8f-feb2b4b6c7c1/20UM1IM03632.rgb.jpg/200x200bb.png\",\"genres\":[{\"genreId\":\"6\",\"name\":\"Country\",\"url\":\"https://itunes.apple.com/us/genre/id6\"},{\"genreId\":\"34\",\"name\":\"Music\",\"url\":\"https://itunes.apple.com/us/genre/id34\"}],\"url\":\"https://music.apple.com/us/album/dangerous-the-double-album/1540314609?app=music\"}".data(using: .utf8)
    
    func testNetworkResponse() {
        XCTAssertNotNil(sampleData)
        let networkResponse = NetworkResponse(data: sampleData!)
        let decodedAlbum = networkResponse.decode(Album.self)
        XCTAssertEqual(decodedAlbum?.name, "Dangerous: The Double Album")
    }
    
    func testAlbumViewModel() {
        let mockImageService = MockImageService()
        
        XCTAssertNotNil(sampleData)
        let networkResponse = NetworkResponse(data: sampleData!)
        let decodedAlbum = networkResponse.decode(Album.self)
        XCTAssertNotNil(decodedAlbum)
        let albumViewModel = AlbumViewModel(album: decodedAlbum!, imageService: mockImageService)
        
        XCTAssertEqual(albumViewModel.title, "Dangerous: The Double Album")
    }
    
    func testURLGeneration() {
        let endpoint = Endpoints.albums
        let url = endpoint.url
        
        XCTAssertEqual(url?.absoluteString, "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
