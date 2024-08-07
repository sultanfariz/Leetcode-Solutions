func isBoomerang(points [][]int) bool {
  if (points[0][0] == points[1][0] && points[0][1] == points[1][1]) || (points[1][0] == points[2][0] && points[1][1] == points[2][1]) || (points[0][0] == points[2][0] && points[0][1] == points[2][1]) {
    return false
  }
  
  xA := float64(points[0][0] - points[1][0])
  yA := float64(points[0][1] - points[1][1])
  gradA := float64(math.MaxInt)
  if yA != 0 {
    gradA = xA / yA
  }

  xB := float64(points[1][0] - points[2][0]) 
  yB := float64(points[1][1] - points[2][1])
  gradB := float64(math.MaxInt)
  if yB != 0 {
    gradB = xB / yB
  }

  return gradA != gradB
}
