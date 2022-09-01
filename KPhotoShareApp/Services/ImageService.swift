import Foundation
import SwiftUI
import Combine

class ImageService {
    @Published var image: UIImage? = nil

    private var imageSubscription: AnyCancellable?
    private let post: PostModel

    private let fileManager = LocalFileManager.instance
    private let folderName = "post_images"
    private let imageName: String

    init(post: PostModel){
        self.post = post
        self.imageName = post.id
        getPhoto()
    }

    private func getPhoto() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName){
            image = savedImage
            print("Retrieved image from file Manager")
        } else {
            downloadPhoto()
            print("Download image now")
        }

    }

    private func downloadPhoto() {
        guard let url = URL(string: post.thumbnailURL) else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({(data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self](returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })

    }

}
