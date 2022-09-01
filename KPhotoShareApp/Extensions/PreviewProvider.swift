import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}

    let homeVM = HomeViewModel()

    let post = PostModel(id: "60cc705d0025904750ee22d300020eb4", userID: "552cc6e60239407cc558338b00000002", mediaType: "image", filename: "tanjir-ahmed-chowdhury-FCfu2MtA4Pw-unsplash.jpg", size: 983178, createdAt: "2021-06-18T10:07:25Z", contentType: "image/jpeg", thumbnailURL: "https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/imageresize/i/60cc705d0025904750ee22d300020eb4/0.jpg", downloadURL: "https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/images/60cc705d0025904750ee22d300020eb4/download/tanjir-ahmed-chowdhury-FCfu2MtA4Pw-unsplash.jpg", resx: 3456, resy: 5184)
}
