/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findTarget(root *TreeNode, k int) bool {
  arr := traverseTree(root)
  left, right := 0, len(arr)-1
  for {
    if left >= right {
      break
    }
    sum := arr[left] + arr[right]
    if sum == k { 
      return true 
    } else if sum > k { 
      right-- 
    } else { 
      left++ 
    }
  }
  
  return false
}

func traverseTree(root *TreeNode) (res []int) {
  if root == nil {
    return
  }

  res = append(res, traverseTree(root.Left)...)
  res = append(res, root.Val)
  return append(res, traverseTree(root.Right)...)
}
