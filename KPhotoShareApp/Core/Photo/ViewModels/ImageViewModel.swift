import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false


    private let post: PostModel
    private let dataService: ImageService
    private var cancellables = Set<AnyCancellable>()

    init(post: PostModel) {
        self.post = post
        self.dataService = ImageService(post: post)
        self.addSubscribers()
        self.isLoading = true
    }
    private func addSubscribers() {
        dataService.$image
            .sink{[weak self] (_) in
                self?.isLoading = false

            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
