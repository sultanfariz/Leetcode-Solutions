type Node struct {
  Key int
  Value int
  Prev *Node
  Next *Node
}

type LRUCache struct {
  Capacity int
  Cache map[int]*Node
  Front *Node
  Rear *Node
}


func Constructor(capacity int) LRUCache {
  return LRUCache{
    Capacity: capacity,
    Cache: make(map[int]*Node),
  }
}

func (this *LRUCache) insertRear(key int, value int) {
  newNode := &Node{
    Key: key,
    Value: value,
    Prev: this.Rear,
  }
  if this.Rear != nil {
    this.Rear.Next = newNode
  }
  this.Rear = newNode
  this.Cache[key] = newNode
}


func (this *LRUCache) Get(key int) int {
  v, ok := this.Cache[key]
  if !ok || v == nil {
    return -1
  }
  
  value := v.Value
  if v.Next == nil {
    return value
  }

  if v == this.Front {
    this.Front = v.Next
    this.Front.Prev = nil
  } else {
    v.Prev.Next = v.Next
    v.Next.Prev = v.Prev
  }

  this.insertRear(key, value)
  return value
}


func (this *LRUCache) Put(key int, value int)  {
  v, ok := this.Cache[key]
  if ok && v != nil {
    if v == this.Rear {
      v.Value = value
      return
    } 
    if v == this.Front {
      this.Front = v.Next
    } else {
      v.Prev.Next = v.Next
    }
    v.Next.Prev = v.Prev
    this.insertRear(key, value)
    return
  }

  if this.Capacity > 0 {
    if this.Front == nil {
      this.insertRear(key, value)
      this.Front = this.Rear
      this.Capacity--
      return
    }
    
    this.insertRear(key, value)
    this.Capacity--
    return
  }

  this.insertRear(key, value)
  delete(this.Cache, this.Front.Key)
  this.Front = this.Front.Next
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * obj := Constructor(capacity);
 * param_1 := obj.Get(key);
 * obj.Put(key,value);
 */
