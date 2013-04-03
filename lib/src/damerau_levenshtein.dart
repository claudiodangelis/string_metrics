part of string_metric;

int damerau_levenshtein(String s, String t) {
  
  int lenSPlus1 = s.length+1;
  int lenTPlus1 = t.length+1;
  
  Matrix<int> d = new Matrix<int>(lenSPlus1, lenTPlus1);

  int i,j,cost;
  
  for(i=0; i<=s.length; i++) {
    d.put(i,0,i);
  }
  
  for(j=0; j<=t.length; j++) {
    d.put(0,j,j);
  }
  
  for(i=1; i<lenSPlus1; i++) {
    for(j=1; j<lenTPlus1; j++) {
      
      if(s[i-1] == t[j-1])
        cost = 0;
      else
        cost = 1;
      
      int temp1 = 1 + d.elementAt(i-1, j);
      int temp2 = 1 + d.elementAt(i, j-1);
      
      var partialTotalCost = min(temp1, temp2);
      partialTotalCost = min(partialTotalCost, d.elementAt(i-1, j-1) + cost);
      
      d.put(i, j, partialTotalCost);
      
      if(i>1 && j>1 && s[i-1] == t[j-2]  && s[i-2] == t[j-1]) {
        
        var finalPutting = min(d.elementAt(i, j), cost + d.elementAt(i-2, j-2));
        d.put(i, j, finalPutting);
        
      }
      
      
      }
  }
  

  return d.elementAt(s.length, t.length);

}


