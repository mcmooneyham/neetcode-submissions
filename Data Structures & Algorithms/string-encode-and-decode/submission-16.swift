class Solution {

    func encode(_ strs: [String]) -> String {
        strs.map { "," + Data($0.utf8).base64EncodedString() }.joined()
    }

    func decode(_ str: String) -> [String] {
        guard !str.isEmpty else { return [] }
        let decoded = str.dropFirst().split(separator: ",", omittingEmptySubsequences: false).map {
            String(data: Data(base64Encoded: String($0))!, encoding: .utf8)!
        }
        return decoded
    }
}
