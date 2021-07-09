# trees
### The tree is a data structure of profound importance. It is used in numerous facets of software development, such as:
1. Representing hierarchical relationships.
2. Managing sorted data.
3. Facilitating fast lookup operations.

* Node: trees are made up of **nodes**.
* Parent & Child: Every node (except for the topmost one) is connected to exactly one node above it. That node is called a **parent** node. The nodes directly below and connected to it are called its **child** nodes. 
* Root: The topmost node in the tree is called the **root**  
* Leaf: A node is a leaf if it has no children

```
class TreeNode<T> {
  public var value: T
  public var children: [TreeNode] = []
  public init(_ value: T) {
    self.value = value
  }
  
  func add(_ child: TreeNode) {
    children.append(child)
  }
  
  func forEachDepthFirst(visit: (TreeNode) -> Void) {
    visit(self)
    children.forEach {
      $0.forEachDepthFirst(visit: visit)
    }
  }
}
```
