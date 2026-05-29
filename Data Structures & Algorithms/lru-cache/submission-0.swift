class LRUCache {

    private class CacheNode {
        let key: Int
        var value: Int
        var previousNode: CacheNode?
        var nextNode: CacheNode?
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var cacheMap: [Int: CacheNode] = [:]

    private let headNode = CacheNode(0,0)
    private let tailNode = CacheNode(0,0)

    init(_ capacity: Int) {
        self.capacity = capacity
        headNode.nextNode = tailNode
        tailNode.previousNode = headNode
    }

    func get(_ key: Int) -> Int {
        guard let node = cacheMap[key] else {
            return -1
        }

        moveNodeToHead(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let existingNode = cacheMap[key] {
            existingNode.value = value
            moveNodeToHead(existingNode)
            return
        }

        let newNode = CacheNode(key, value)
        cacheMap[key] = newNode
        addNodeRightAfterHead(newNode)

        if cacheMap.count > capacity {
            removeLeastRecentlyUsed()
        }
    }

    private func addNodeRightAfterHead(_ node: CacheNode) {
        node.previousNode = headNode
        node.nextNode = headNode.nextNode
        headNode.nextNode?.previousNode = node
        headNode.nextNode = node
    }

    private func removeNode(_ node: CacheNode) {
        let previousNode = node.previousNode
        let nextNode = node.nextNode

        previousNode?.nextNode = nextNode
        nextNode?.previousNode = previousNode

        node.previousNode = nil
        node.nextNode = nil
    }

    private func moveNodeToHead(_ node: CacheNode) {
        removeNode(node)
        addNodeRightAfterHead(node)
    }

    private func removeLeastRecentlyUsed() {
        guard let nodeToRemove = tailNode.previousNode, nodeToRemove !== headNode 
        else { return }

        removeNode(nodeToRemove)
        cacheMap[nodeToRemove.key] = nil
        
    }
}
