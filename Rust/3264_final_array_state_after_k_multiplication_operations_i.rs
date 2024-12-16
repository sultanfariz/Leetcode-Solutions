impl Solution {
  pub fn get_final_state(mut nums: Vec<i32>, k: i32, multiplier: i32) -> Vec<i32> {
    for i in 0..k {
      let mut smallest = nums[0];
      let mut idx = 0;
      for (j, el) in nums.iter().enumerate() {
        if *el < smallest {
          smallest = *el;
          idx = j;
        }
      }

      nums[idx] = nums[idx] * multiplier;
    }

    return nums;
  }
}
