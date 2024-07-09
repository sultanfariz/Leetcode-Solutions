func findTheWinner(n int, k int) int {
  // list of all friends
  friends := []int{}
  for i:=1; i<=n; i++ {
    friends = append(friends, i)
  }

  // simulate the game
  idx := k - 1
  for {
    friendsLen := len(friends)
    if friendsLen == 1 {
      return friends[0]
    }
    if idx >= friendsLen {
      idx = idx % friendsLen
    }
    
    friends = append(friends[:idx], friends[idx+1:]...)

    idx += k-1
  }

  return friends[0]
}
