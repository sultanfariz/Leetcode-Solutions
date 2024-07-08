/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func nodesBetweenCriticalPoints(head *ListNode) []int {
  idx := 1
  critPointArr := []int{}
  for {
    if head.Next.Next == nil {
      break
    }

    if (head.Val > head.Next.Val && head.Next.Next.Val > head.Next.Val) || (head.Val < head.Next.Val && head.Next.Next.Val < head.Next.Val) {
      critPointArr = append(critPointArr, idx+1)
    }

    head = head.Next
    idx++
  }

  fmt.Println(critPointArr)

  n := len(critPointArr)
  if n <= 1 {
    return []int{-1, -1}
  }

  max := critPointArr[n-1] - critPointArr[0]
  min := max
  for i := 1; i<n; i++ {
    diff := critPointArr[i] - critPointArr[i-1]
    if diff < min {
      min = diff
    }
  }

  return []int{min, max}
}
