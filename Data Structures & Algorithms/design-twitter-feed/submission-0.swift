class Twitter {
    // Tweet Class Object
    class Tweet {
        let user: Int
        let tweetId: Int
        init(_ userId: Int, _ tweetId: Int) {
            self.user = userId
            self.tweetId = tweetId
        }
    }
    // User Class Object
    class User {
        let id: Int
        var tweets: [Tweet] = []
        var following: Set<Int> = []   
        init(_ id: Int) {
            self.id = id
        }
    }
    // Map of userId to User Object
    private var userById: [Int: User] = [:]
    // Global list of all tweets in chronological order
    private var allTweets: [Tweet] = []

    init() { }

    private func userForId(_ userId: Int) -> User {
        if let existingUser = userById[userId] {
            return existingUser
        }
        let newUser = User(userId)
        userById[userId] = newUser
        return newUser
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        let author = userForId(userId)
        let tweet = Tweet(userId, tweetId)
        author.tweets.append(tweet)
        allTweets.append(tweet)
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        guard let user = userById[userId] else {
            return []
        }
        var feedTweetIds: [Int] = []
        var index = allTweets.count - 1
        // Scan from the newest tweet backwards
        while index >= 0 && feedTweetIds.count < 10 {
            let tweet = allTweets[index]
            // Include if a tweet is by the user or someone they follow
            if tweet.user == userId || user.following.contains(tweet.user) {
                feedTweetIds.append(tweet.tweetId)
            }
            index -= 1
        }
        return feedTweetIds
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        if followerId == followeeId { return }   // ignore self-follow
        let follower = userForId(followerId)
        _ = userForId(followeeId)                // ensure followee exists
        follower.following.insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard let follower = userById[followerId] else {   
            return
        }
        follower.following.remove(followeeId)
    }
}