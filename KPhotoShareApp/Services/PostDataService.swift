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

        postSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink {(completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self](returnedPosts) in
                self?.allPosts = returnedPosts
                self?.postSubscription?.cancel()
            }
    }
}
