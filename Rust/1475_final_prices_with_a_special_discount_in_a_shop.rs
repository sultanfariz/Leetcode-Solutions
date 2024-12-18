impl Solution {
  pub fn final_prices(mut prices: Vec<i32>) -> Vec<i32> {
    for (i, el) in prices.clone().iter().enumerate() {
      for j in i+1..prices.len() {
        if prices[i] >= prices[j] {
          prices[i] -= prices[j];
          break;
        }
      }
    }

    prices
  }
}
