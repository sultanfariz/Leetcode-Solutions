/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func delNodes(root *TreeNode, to_delete []int) []*TreeNode {
  targetMap := make(map[int]bool)
  for _, v := range to_delete{
    targetMap[v] = true
  }

  return delNode(root, targetMap, true)
}

func delNode(root *TreeNode, target map[int]bool, isParentDeleted bool) []*TreeNode {
  res := []*TreeNode{}
  if root == nil {
    return res
  }

  left := root.Left
  right := root.Right
  isCurrDeleted := false

  if target[root.Val] {
    root.Left = nil
    root.Right = nil
    delete(target, root.Val)
    isCurrDeleted = true
  } else if isParentDeleted {
    res = append(res, root)
  }

  if root.Left != nil && target[root.Left.Val] {
    root.Left = nil
  }
  if root.Right != nil && target[root.Right.Val] {
    root.Right = nil
  }

  res = append(res, delNode(left, target, isCurrDeleted)...)
  res = append(res, delNode(right, target, isCurrDeleted)...)

  return res
}
