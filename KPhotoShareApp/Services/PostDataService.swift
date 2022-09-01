import Foundation
import Combine

class PostDataService {
    @Published var allPosts: [PostModel] = []

    var postSubscription: AnyCancellable?

    init() {
        getPosts()
    }

    private func getPosts() {
        guard let url = URL(string: "https://api1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/media" ) else { return }

        postSubscription = NetworkingManager.download(url: url)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedPosts) in
                self?.allPosts = returnedPosts
                self?.postSubscription?.cancel()
            })

    }
}
