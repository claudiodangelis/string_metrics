import 'package:unittest/unittest.dart';
import 'package:string_metric/string_metric.dart';

main() {

  group('Levenshtein Distance', (){

    test("Properties",(){
      String s = "Dart";
      String t = "Go";
      // It is always at least the difference of the sizes of the two strings
      expect(levenshtein(s,t) , greaterThanOrEqualTo(s.length - t.length));

      // It is at most the length of the longer string
      expect(levenshtein(s,t) , lessThanOrEqualTo( longer(s,t)) );

      // It is zero if and only if the strings are identical
      if (identical(s,t)){
        expect(levenshtein(s,t),equals(0));
      } else {
        expect(levenshtein(s,t), isNot(0));
      }

      // If the strings are the same size, the Hamming distance is an upper bound on the Levenshtein distance

      if(s.length==t.length) {
        expect(hamming(s,t) , greaterThanOrEqualTo(levenshtein(s,t)));
      }
    });

    test('General', () {
      // Case sensitive:
      expect(levenshtein("Dart", "dart"), equals(1));

      // Case in-sensitive
      expect(levenshtein("Dart", "dart", false), equals(0));
    });


  });

  group('Hamming Distance', () {
    test("General", (){
      expect(hamming("1011101","1001001"), equals(2));
      expect(hamming("toned","roses"), equals(3));
      expect(hamming("2173896", "2233796"), equals(3));
      expect(hamming("dart","d"), equals(-1));
    });
  });
  
  group('Damerau-Levenshtein Distance', () {
      test("General", (){
        expect(damerau_levenshtein("test","test"), equals(0));
        expect(damerau_levenshtein("test","tent"), equals(1));
        expect(damerau_levenshtein("CA", "ABC"), equals(3));
        expect(damerau_levenshtein("dart","d"), equals(3));
      });
  });
}

int longer(String str1, String str2) {
  if ( str1.length > str2.length) return str1.length;
  return str2.length;
}