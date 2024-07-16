/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func createBinaryTree(descriptions [][]int) *TreeNode {
  nodeMap := make(map[int]*TreeNode)
  rootMap := make(map[int]bool)
  for _, v := range descriptions {
    isLeft := v[2]
    child, ok := nodeMap[v[1]]
    if !ok {
      child = &TreeNode{
        Val: v[1],
      }
    }
    parent, ok := nodeMap[v[0]]
    if !ok {
      parent = &TreeNode{
        Val: v[0],
      }
    }

    if isLeft == 1 {
      parent.Left = child
    } else {
      parent.Right = child
    }

    nodeMap[parent.Val] = parent
    nodeMap[child.Val] = child

    // organize the rootMap -> to determine which node is the root
    _, ok = rootMap[parent.Val]
    if !ok {
      rootMap[parent.Val] = true
    } 
    rootMap[child.Val] = false
  }
  
  root := &TreeNode{}
  for k, v := range rootMap {
    if v {
      root = nodeMap[k]
    }
  }

  return root
}
