
/*
 JSON Data

 URL: https://api1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/media

 {
 "id":"60cc705d0025904750ee22d300020eb4",
 "user_id":"552cc6e60239407cc558338b00000002",
 "media_type":"image",
 "filename":"tanjir-ahmed-chowdhury-FCfu2MtA4Pw-unsplash.jpg",
 "size":983178,
 "created_at":"2021-06-18T10:07:25Z",
 "taken_at":null,
 "guessed_taken_at":null,
 "md5sum":"c05b80be8e13edbfac2ae089e4b4588a",
 "content_type":"image/jpeg",
 "video":null,
 "thumbnail_url":"https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/imageresize/i/60cc705d0025904750ee22d300020eb4/0.jpg",
 "download_url":"https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/images/60cc705d0025904750ee22d300020eb4/download/tanjir-ahmed-chowdhury-FCfu2MtA4Pw-unsplash.jpg",
 "resx":3456,
 "resy":5184
 },
 */

import Foundation

struct PostModel: Identifiable, Codable {
    let id, userID, mediaType, filename: String
    let size: Double
    let createdAt: String
    let contentType: String
    let thumbnailURL, downloadURL: String
    let resx, resy: Int

    enum CodingKeys: String, CodingKey {
        case id, filename, size, resx, resy
        case userID = "user_id"
        case mediaType = "media_type"
        case contentType = "content_type"
        case thumbnailURL = "thumbnail_url"
        case downloadURL = "download_url"
        case createdAt = "created_at"
    }

    func asNumberString() -> String {
        return String(format: "%.2f")
    }

    var mbSize: String {
        let formatted = size / 1000000
        return "\(formatted.asNumberString())mb"
    }
}
