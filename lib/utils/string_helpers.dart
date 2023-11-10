String getInitials(String text) => text.isNotEmpty
    ? text.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';

    String ordinal(int number) {
    if(!(number >= 1 && number <= 100)) {//here you change the range
      throw Exception('Invalid number');
    }

    if(number >= 11 && number <= 13) {
      return 'th';
    }

    switch(number % 10) {
      case 1: return 'st';
      case 2: return 'nd';
      case 3: return 'rd';
      default: return 'th';
    }
}

extension StringExtensions on String { 
  String capitalize() { 
    return "${this[0].toUpperCase()}${this.substring(1)}"; 
  } 
}