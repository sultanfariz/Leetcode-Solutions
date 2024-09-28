type Node struct {
  Val   int
  Next  *Node
  Prev  *Node
}

type MyCircularDeque struct {
  Front *Node
  Rear  *Node
  Slot  int
}


func Constructor(k int) MyCircularDeque {
  return MyCircularDeque{
    Slot: k,
    Front: nil,
    Rear: nil,
  }
}


func (this *MyCircularDeque) InsertFront(value int) bool {
  if this.Slot == 0 {
    return false
  }

  newNode := Node{
    Val: value,
    Next: this.Front,
    Prev: nil,
  }
  if this.Front == nil {
    this.Rear = &newNode
  } else {
    this.Front.Prev = &newNode
  }
  this.Front = &newNode
  this.Slot--

  return true
}


func (this *MyCircularDeque) InsertLast(value int) bool {
  if this.Slot == 0 {
    return false
  }

  newNode := Node{
    Val: value,
    Prev: this.Rear,
    Next: nil,
  }
  if this.Rear == nil {
    this.Front = &newNode
  } else {
    this.Rear.Next = &newNode
  }
  this.Rear = &newNode
  this.Slot--


  return true  
}


func (this *MyCircularDeque) DeleteFront() bool {
  if this.Front == nil {
    return false
  }

  if this.Front.Next == nil {
    this.Rear = nil
  } else {
    this.Front.Next.Prev = nil
  }
  this.Front = this.Front.Next
  this.Slot++

  return true  
}


func (this *MyCircularDeque) DeleteLast() bool {
  if this.Rear == nil {
    return false
  }

  if this.Rear.Prev == nil {
    this.Front = nil
  } else {
    this.Rear.Prev.Next = nil
  }
  this.Rear = this.Rear.Prev
  this.Slot++

  return true    
}


func (this *MyCircularDeque) GetFront() int {
  if this.Front == nil {
    return -1
  }
  return this.Front.Val 
}


func (this *MyCircularDeque) GetRear() int {
  if this.Rear == nil {
    return -1
  }
  return this.Rear.Val 
}


func (this *MyCircularDeque) IsEmpty() bool {
  return this.Front == nil && this.Rear == nil
}


func (this *MyCircularDeque) IsFull() bool {
  return this.Slot == 0 
}


/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * obj := Constructor(k);
 * param_1 := obj.InsertFront(value);
 * param_2 := obj.InsertLast(value);
 * param_3 := obj.DeleteFront();
 * param_4 := obj.DeleteLast();
 * param_5 := obj.GetFront();
 * param_6 := obj.GetRear();
 * param_7 := obj.IsEmpty();
 * param_8 := obj.IsFull();
 */
