/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func spiralMatrix(m int, n int, head *ListNode) (matrix [][]int) {
  // create the matrix
  for _ = range m {
    row := []int{}
    for _ = range n {
      row = append(row, -1)
    }
    matrix = append(matrix, row)
  }

  var copy func(*ListNode, int, int) (*ListNode, bool)
  copy = func(head *ListNode, x, y int) (*ListNode, bool) {
    if head != nil { 
      matrix[x][y] = head.Val
      head = head.Next
      return head, true
    }

    return nil, false
  }

  x, y := 0, -1
  flag := true
  for head != nil {
    // right
    for _ = range n {
      y++
      head, flag = copy(head, x, y); 
      if !flag { return }
    }
    m --

    // down
    for _ = range m {
      x++
      head, flag = copy(head, x, y); 
      if !flag { return }
    }
    n--

    // left
    for _ = range n {
      y--
      head, flag = copy(head, x, y); 
      if !flag { return }
    }
    m--

    // up
    for _ = range m {
      x--
      head, flag = copy(head, x, y); 
      if !flag { return }
    }
    n--
  }

  return matrix
}
