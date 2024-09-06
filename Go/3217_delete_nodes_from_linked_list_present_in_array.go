/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func modifiedList(nums []int, head *ListNode) *ListNode {
  // put to-be-removed in hashmap to ease the accessing process
  numsMap := map[int]bool{}
  for _, num := range nums {
    numsMap[num] = true
  }

  // maintain current head
  var curr *ListNode
  var root *ListNode
  for {
    if head == nil { 
      curr.Next = nil
      break 
    }

    if numsMap[head.Val] {
      head = head.Next
      continue
    }

    if curr == nil {
      root = head
      curr = head
      head = head.Next
      continue
    }

    curr.Next = head
    curr = head
    head = head.Next
  }

  return root
}
