import Foundation;

class Node
{
    var data: Int
    var left: Node?
    var right: Node?
    init(_ data: Int)
    {
        // Assign data to the new node, set left and right children to null
        self.data = data
        self.left = nil
        self.right = nil
    }
}

class BinaryTree
{
    // Represent the root of binary tree
    var root: Node?
    init() {
        self.root = nil
    }
    
    // findMaximumWidth() will find out the maximum width of the given binary tree
    func findMaximumWidth() -> Int
    {
        var maxWidth: Int = 0
        var nodesInLevel: Int = 0
        var queue: [Node] = []
        // Check if root is null, then width will be 0
        if (self.root == nil)
        {
            print("Tree is empty")
            return 0;
        }
         else
        {
            queue.append(self.root!)
            while (queue.count != 0)
            {
                nodesInLevel = queue.count
                maxWidth = (maxWidth < nodesInLevel) ? nodesInLevel : maxWidth
                while (nodesInLevel > 0)
                {
                    let current: Node? = queue.removeFirst();
                    if (current!.left != nil) {
                        queue.append(current!.left!)
                    }
                    if (current!.right != nil) {
                        queue.append(current!.right!)
                    }
                    nodesInLevel -= 1
                }
            }
        }
        return maxWidth
    }
    static func main(_ args : inout [String])
    {
        let bt : BinaryTree? = BinaryTree()
        // Add nodes to the binary tree
        bt!.root = Node(1)
        bt!.root!.left = Node(2)
        bt!.root!.right = Node(3)
        bt!.root!.left!.left = Node(4)
        bt!.root!.left!.right = Node(5)
        bt!.root!.right!.left = Node(6)
        bt!.root!.right!.right = Node(7)
        bt!.root!.left!.left!.left = Node(8)
        print("Maximum width of the binary tree: " + String(bt!.findMaximumWidth()))
    }
}

var record: [String] = CommandLine.arguments
BinaryTree.main(&record)
