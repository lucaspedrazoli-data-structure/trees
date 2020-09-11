// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

func printEachLevel<T>(for tree: TreeNode<T>) {
  var queue = Queue<TreeNode<T>>()
  var nodesLeftInCurrentLevel = 0
  queue.enqueue(tree)
  while !queue.isEmpty {
    nodesLeftInCurrentLevel = queue.count
    while nodesLeftInCurrentLevel > 0 {
      guard let node = queue.dequeue() else { break }
      print(" \(node.value)", terminator: "")
      node.children.forEach { queue.enqueue($0) }
      nodesLeftInCurrentLevel -= 1
    }
    print()
  }
}


func makeBeverageTree() -> TreeNode<String> {
  let tree = TreeNode("Beverages")

  let hot = TreeNode("hot")
  let cold = TreeNode("cold")

  let tea = TreeNode("tea")
  let coffee = TreeNode("coffee")
  let chocolate = TreeNode("cocoa")

  let blackTea = TreeNode("black")
  let greenTea = TreeNode("green")
  let chaiTea = TreeNode("chai")

  let soda = TreeNode("soda")
  let milk = TreeNode("milk")

  let gingerAle = TreeNode("ginger ale")
  let bitterLemon = TreeNode("bitter lemon")

  tree.add(hot)
  tree.add(cold)

  hot.add(tea)
  hot.add(coffee)
  hot.add(chocolate)

  cold.add(soda)
  cold.add(milk)

  tea.add(blackTea)
  tea.add(greenTea)
  tea.add(chaiTea)

  soda.add(gingerAle)
  soda.add(bitterLemon)

  return tree
}

example(of: "depth first traversal") {
  let tree = makeBeverageTree()
  tree.forEachDepthFirst { print($0.value) }
}

example(of: "level order traversal") {
  let tree = makeBeverageTree()
  tree.forEachLevelOrder { print($0.value) }
}

example(of: "Searching for a node") {
  let tree = makeBeverageTree()
  if let searchResult1 = tree.search("ginger ale") {
    print("found node value: \(searchResult1.value)")
  }

  if let searchResult2 = tree.search("WKD Blue") {
    print(searchResult2.value)
  } else {
    print("Could not find WKD Blue")
  }
}

example(of: "level order print break row each level") {
  let root = TreeNode("15")
  let child1 = TreeNode("1")
  let child2 = TreeNode("17")
  let child3 = TreeNode("20")
  root.add(child1)
  root.add(child2)
  root.add(child3)
  let child4 = TreeNode("1")
  let child5 = TreeNode("5")
  let child6 = TreeNode("0")
  child1.add(child4)
  child1.add(child5)
  child1.add(child6)
  let child7 = TreeNode("2")
  child2.add(child7)
  let child8 = TreeNode("5")
  let child9 = TreeNode("7")
  child3.add(child8)
  child3.add(child9)
  let node = TreeNode("99")
  child4.add(node)
  printEachLevel(for: root)
}
