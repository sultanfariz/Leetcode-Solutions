/**
 * Definition for a Node.
 * type Node struct {
 *     Val int
 *     Children []*Node
 * }
 */

func postorder(root *Node) []int {
  order := []int{}
  if root == nil { return order }
  if len(root.Children) != 0 {
    for _, child := range root.Children {
      order = append(order, postorder(child)...)
    }
  }

  return append(order, root.Val)
}
