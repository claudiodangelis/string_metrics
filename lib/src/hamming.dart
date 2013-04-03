part of string_metric;

int hamming(String s, String t) {
  
  if(s.length!=t.length) return -1;

  int distance = 0;

  for(int i = 0; i<s.length; i++) {
    if(s[i] != t[i]) distance++;
  }

  return distance;
}

int hamming2(FinalPair pair) {
  
  if(pair is FinalPair<String, String>)
    return hamming(pair.first, pair.second);

  if(pair is FinalPair<BinaryString, BinaryString>)
    return hamming3(pair.first, pair.second);
  
  if(pair is FinalPair<String, BinaryString>)
    return hamming(pair.first, pair.second.value);
  
  if(pair is FinalPair<BinaryString, String>)
    return hamming(pair.first.value, pair.second);
  
  return -1;
  
}

int hamming3(BinaryString b1, BinaryString b2) {
  
  return hamming(b1.value, b2.value);
  
}