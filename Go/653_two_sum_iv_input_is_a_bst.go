/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */

var (
  nodeMap = make(map[int]bool)
)

func findTarget(root *TreeNode, k int) bool {
  res := traverseTree(root, k)
  // clean global variable
  nodeMap = make(map[int]bool)
  return res
}

func traverseTree(root *TreeNode, k int) bool {
  if root == nil {
    return false
  }
  if nodeMap[k-root.Val] {
    return true
  }
  nodeMap[root.Val] = true
  return traverseTree(root.Left, k) || traverseTree(root.Right, k)
}
