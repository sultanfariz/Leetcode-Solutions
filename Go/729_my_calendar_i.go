type MyCalendar struct {
  Cal map[int]int
}

func Constructor() MyCalendar {
  return MyCalendar{
    Cal: map[int]int{},
  }  
}

func (this *MyCalendar) Book(start int, end int) bool {
  for k, v := range this.Cal {
    if start <= k && end > k { 
      return false 
    } else if start >= k && start < v { 
      return false 
    }
  }
  this.Cal[start] = end
  return true
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.Book(start,end);
 */
