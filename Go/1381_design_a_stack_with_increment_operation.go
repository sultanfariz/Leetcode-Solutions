type CustomStack struct {
  Slot  int
  Stack []int
}


func Constructor(maxSize int) CustomStack {
  return CustomStack{
    Slot: maxSize,
    Stack: []int{},
  }
}


func (this *CustomStack) Push(x int)  {
  if this.Slot == 0 {
    return
  }

  this.Stack = append(this.Stack, x)
  this.Slot--
}


func (this *CustomStack) Pop() int {
  n := len(this.Stack)
  fmt.Printf("n: %+v\n", n)
  if n == 0 {
    return -1
  }

  num := this.Stack[n-1]
  this.Stack = this.Stack[:n-1]
  this.Slot++
  return num
}


func (this *CustomStack) Increment(k int, val int)  {
  for i := range k {
    if i > len(this.Stack)-1 { break }
    this.Stack[i] += val
  }
}


/**
 * Your CustomStack object will be instantiated and called as such:
 * obj := Constructor(maxSize);
 * obj.Push(x);
 * param_2 := obj.Pop();
 * obj.Increment(k,val);
 */
