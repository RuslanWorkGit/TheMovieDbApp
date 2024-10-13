

import Foundation

struct Genres: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Hashable {
    let id: Int
    let name: String
}
