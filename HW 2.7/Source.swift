//
//  Source.swift
//  HW 2.7
//
//  Created by Alexey Manokhin on 04.12.2023.
//

struct Source {
    static func allPhotos() -> [Photo] {
        [
            Photo(id: 1, imageName: "img1"),
            Photo(id: 2, imageName: "img2"),
            Photo(id: 3, imageName: "img3")
        ]
    }
    
    static func getRandomPhotos(with count: Int) -> [Photo] {
        (0...count).map { _ in allPhotos().randomElement() ?? Photo(id: 1, imageName: "img1")}
    }
}

struct Photo {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    let photos: [Photo]
}
