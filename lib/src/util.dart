part of string_metric;

class FinalPair<F, S> {
  
  F _firstValue;
  S _secondValue;
  
  F get first => _firstValue;
  S get second => _secondValue;
  
  FinalPair(F first, S second) {
    
    this._firstValue = first;
    this._secondValue = second;
    
  }
  
  bool operator == (Object other) {
    if(other is! FinalPair)
      return false;
    
    FinalPair fp = other;
    
    if(fp.first is! F || fp.second is! S)
      return false;
    
    if(other.first == this.first && other.second == this.second)
      return true;
    
    return false;
      
  }
  
}

class BinaryString {
  
  String _value;
  
  BinaryString(String value) {
    
    if(isBinary(value))
       this._value = value;
    
    else
      throw "$value is not a binary string!";
    
  }
  
  String get value => this._value;
  
  void setValue(String value) {
    
    if (isBinary(value))
        this._value = value;
    
    else
      throw "$value is not a binary string!";
    
  }
  
  bool isBinary(String s) {
   
    for(var i=0; i<s.length; i++) {
     
      if(s[i]!='0' && s[i]!='1')
        return false;
      
    }
    
    return true;
    
   }
}

class Matrix<T> {
  
  List<List<T>> _matrix;
  int _rows;
  int _columns;
  
  Matrix(int rows, int columns) {
    assert(rows>0 && columns>0);
    
    this._rows = rows;
    this._columns = columns;
    
    _matrix = new List<List<T>>(rows);
    
    for(var i=0; i<rows; i++) {
      _matrix[i] = new List<T>(columns);
    }
  }
  
  void put(int row, int column, T value) {
    assert(row<=this._rows && column<=this._columns);
    
    List temp = _matrix[row];
    temp[column] = value;    
    
  }
  
  T elementAt(int row, int column) {
    assert(row<=this._rows && column<=this._columns);
    
    List temp = _matrix[row];
    
    var toReturn = temp[column];
    
    if(toReturn == null)
      return 0;
    
    return toReturn;
    
  }
  
}