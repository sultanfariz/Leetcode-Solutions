type WordDictionary struct {
  Dict map[string]bool
}


func Constructor() WordDictionary {
  return WordDictionary{
    Dict: map[string]bool{},
  }
}


func (this *WordDictionary) AddWord(word string)  {
  this.Dict[word] = true
}


func (this *WordDictionary) Search(word string) bool {
  // iterate over string
  dot1, dot2 := -1, -1
  for i, char := range word {
    if string(char) == "." && dot1 == -1 {
      dot1 = i
      continue
    }

    if string(char) == "." && dot2 == -1 {
      dot2 = i
    }
  }
  
  // if there are no . , retrieve from dict
  if dot1 == -1 {
    return this.Dict[word]
  }
  
  temp := word
  for i := range 26 {
    // replace the . with alphabet from a-z
    temp = temp[:dot1] + string(rune('a'+i)) + temp[dot1+1:]

    if dot2 != -1 {
      for j := range 26 {
        temp = temp[:dot2] + string(rune('a'+j)) + temp[dot2+1:]
        if this.Dict[temp] {
          return true
        }
      }
    }

    // check if new word exists in dictionary
    if this.Dict[temp] {
      return true
    }
  }

  return false
}


/**
 * Your WordDictionary object will be instantiated and called as such:
 * obj := Constructor();
 * obj.AddWord(word);
 * param_2 := obj.Search(word);
 */
