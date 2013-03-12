part of string_metric;

int hamming(String s, String t) {
  if(s.length!=t.length) return -1;

  int distance = 0;

  for(int i = 0; i<s.length; i++) {
    if(s[i] != t[i]) distance++;
  }

  return distance;
}

