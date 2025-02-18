
import Foundation
import Locksmith

class ViewModelMoviesVC {
    weak var delegate: UpdateView?
    public var arrayOfMediaByGenre = [Media]()
    public var upcoming = [Media]()
    public var trending = [Media]()
    public var topRated = [Media]()
    public var genres = [Genre]()
    
    public func fetchGenres(type: String, completion: @escaping () -> Void) {
        NetworkManager.shared.loadGenresForMedia(type: type) { genres in
            self.genres = genres
            completion()
        }
    }
    public func delSession() {
        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: "Session") else { return }
        NetworkManager.shared.deleteSession(sessionId: dictionary["session"] as! String)
        do {
            try Locksmith.deleteDataForUserAccount(userAccount: "MyAccount")
            try Locksmith.deleteDataForUserAccount(userAccount: "Session")
        } catch {
            print(error)
        }
    }
    public func fetchTrending(type: String, completion: @escaping () -> Void) {
        NetworkManager.shared.loadTrending(type: type) { media in
            self.trending = media
            completion()
        }
    }
    public func fetchUpcoming(type: String, completion: @escaping () -> Void) {
        NetworkManager.shared.loadUpcoming(type: type) { media in
            self.upcoming = media
            completion()
        }
    }
    public func fetchTopRated(type: String, completion: @escaping () -> Void) {
        NetworkManager.shared.loadTopRated(type: type) { media in
            self.topRated = media
            completion()
        }
    }
    
}
