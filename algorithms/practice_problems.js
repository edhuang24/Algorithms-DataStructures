// isPalindrome
// Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use Javascript.
// This solution takes less time and memory than rebuilding the string backward and comparing the two.
// Time complexity: O(n)
// Space complexity: O(1)

function isPalindrome (string) {
  var i = 0;
  var j = string.length - 1;
  while (i < string.length / 2) {
    if (string[i] !== string[j]) {
      return false;
    }
    i += 1;
    j -= 1;
  }
  return true;
}

console.log(isPalindrome("abcba"));

// ************************************************************************** //

// myMap
// Implement the Array#map function in JavaScript.

Array.prototype.myMap = function (callback) {
  var result = [];
  this.forEach( function (el) {
    result.push(callback(el));
  });
  return result;
};

console.log([1,2,3,4,5].myMap(function (x) { return Math.pow(2, x); }));

// ************************************************************************** //
