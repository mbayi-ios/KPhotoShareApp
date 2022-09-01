import Foundation
import SwiftUI
import Combine

class ImageService {

    @Published var image: UIImage? = nil

    private var imageSubscription: AnyCancellable?
    private let post: PostModel

    init(post: PostModel){
        self.post = post
        getPhoto()
    }
    private func getPhoto() {
        guard let url = URL(string: post.thumbnailURL) else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
