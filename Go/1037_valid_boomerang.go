func isBoomerang(points [][]int) bool {
  xA := float64(points[0][0] - points[1][0])
  yA := float64(points[0][1] - points[1][1])

  xB := float64(points[1][0] - points[2][0]) 
  yB := float64(points[1][1] - points[2][1])

  return (xA * yB) != (yA * xB)
}
