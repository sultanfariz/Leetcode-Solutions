impl Solution {
  pub fn pick_gifts(mut gifts: Vec<i32>, k: i32) -> i64 {
    for i in 0..k {
      let mut max = gifts[0];
      let mut idx = 0;
      for (j, pile) in gifts.iter().enumerate() {
        if *pile > max {
          max = *pile;
          idx = j;
        }
      }

      gifts[idx] = (gifts[idx] as f64).sqrt() as i32;
    }

    let mut res: i64 = 0;
    for pile in gifts.iter() {
      res += *pile as i64;
    }
    
    res
  }
}
