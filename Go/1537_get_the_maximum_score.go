func maxSum(first []int, second []int) (res int) {
	// do loop to retrieve the same element / checkpoints
	firstMap := make(map[int]bool)
	for _, el := range first {
		firstMap[el] = true
	}
	checkpoints := []int{}
	for _, el := range second {
		if firstMap[el] {
			checkpoints = append(checkpoints, el)
		}
	}

	// do loop for two arrays to sum elements that exist before checkpoints
	firstSum, secondSum := 0, 0
	i, j := 0, 0
	for i < len(first) || j < len(second) {
		if len(checkpoints) == 0 {
      if i < len(first) {
        firstSum += first[i]
        i++
      }
      if j < len(second) {
        secondSum += second[j]
        j++
      }
      continue
		}


		if i < len(first) && first[i] < checkpoints[0] {
			firstSum += first[i]
			i++
		}
		if j < len(second) && second[j] < checkpoints[0] {
			secondSum += second[j] 
			j++
		}

		// check if already reached checkpoint
		if first[i] == second[j] && first[i] == checkpoints[0] {
			res += checkpoints[0] + max(firstSum, secondSum)

			firstSum, secondSum = 0, 0
			checkpoints = checkpoints[1:] // remove the past checkpoint 
      i, j = i+1, j+1
		}
	}

	res += max(firstSum, secondSum)

	return res % 1000000007
}

func max(a, b int) int {
  if a > b { return a }
  return b
}
