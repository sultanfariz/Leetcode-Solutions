func buildMatrix(k int, rowConditions [][]int, colConditions [][]int) [][]int {
  rowSorted := topologicalSort(rowConditions)
  if len(rowSorted) == 0 {
    return [][]int{}
  }
  colSorted := topologicalSort(colConditions)
  if len(colSorted) == 0 {
    return [][]int{}
  }

  rowSorted = addMissingNums(rowSorted, k)
  colSorted = addMissingNums(colSorted, k)

  // arrange matrix
  res := [][]int{}
  for i:=0; i<k; i++ {
    row := []int{}
    for j:=0; j<k; j++ {
      val := 0
      if rowSorted[i] == colSorted[j] {
        val = rowSorted[i]
      }
      row = append(row, val)
    }
    res = append(res, row)
  }

  return res
}

func addMissingNums(arr []int, k int) []int {
  numMap := make(map[int]bool)
  for _, v := range arr {
    numMap[v] = true
  }

  for i:=1; i<=k; i++ {
    if !numMap[i] {
      arr = append(arr, i)
    }
  }

  return arr
}

func topologicalSort(edges [][]int) []int {
  const (
    NOTVISITED = 0
    VISITING = 1
    VISITED = 2
  )
  edgeMap := make(map[int][]int)
  // sort based on value first
  sort.Slice(edges, func(i,j int) bool {
    if edges[i][0] != edges[j][0] {
      return edges[i][0] < edges[j][0]
    }
    return edges[i][1] < edges[j][1]
  })

  // transform into hashmap
  for i, v := range edges {
    // ignore duplicate conditions
    if i != 0 && edges[i][0] == edges[i-1][0] && edges[i][1] == edges[i-1][1] { continue }
    edgeMap[v[0]] = append(edgeMap[v[0]], v[1])
  }

  visited := make(map[int]int)
  sorted := []int{}
  var dfs func(node int) bool
  dfs = func(node int) bool {
    if visited[node] == VISITING {
      return true
    }
    if visited[node] == VISITED {
      return false
    }
    visited[node] = VISITING
    for _, next := range edgeMap[node] {
      if dfs(next) {
        return true
      }
    }
    visited[node] = VISITED
    sorted = append([]int{node}, sorted...)
    return false
  }
  for k, _ := range edgeMap {
    if visited[k] == NOTVISITED && dfs(k) {
      return []int{}
    }
  }

  return sorted
}
