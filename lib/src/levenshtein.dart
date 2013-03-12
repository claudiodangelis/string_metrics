part of string_metric;

int levenshtein(String s, String t, [bool caseSensitive]) {

  // Dart version of Java version found here: http://rosettacode.org/wiki/Levenshtein_distance#Java

  if(caseSensitive == false) {
    s=s.toLowerCase();
    t=t.toLowerCase();
  }

  /* if either string is empty, difference is inserting all chars
   * from the other
   */

  if(s.length == 0) return t.length;
  if(t.length == 0) return s.length;

  /* if first letters are the same, the difference is whatever is
   * required to edit the rest of the strings
   */

  if(s[0] == t[0]) return levenshtein(s.substring(1), t.substring(1));

  /* else try:
   *      changing first letter of s to that of t,
   *      remove first letter of s, or
   *      remove first letter of t
   */

  int a = levenshtein(s.substring(1), t.substring(1));
  int b = levenshtein(s, t.substring(1));
  int c = levenshtein(s.substring(1), t);

  if(a > b) a = b;
  if(a > c) a = c;

  //any of which is 1 edit plus editing the rest of the strings

  return a + 1;

}

