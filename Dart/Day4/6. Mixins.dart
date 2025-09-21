// Create two mixins:
    // • Logger → has a method log(String msg) that prints [LOG]: msg.
    // • Printer → has a method printData(String data) that prints [DATA]: data.
    // Create a class Report that uses both mixins and adds its own method
    // generateReport().

mixin Logger {
  void log(String msg) {
    print(msg);
  }
}

mixin Printer {
  void printData(String data) {
    print(data);
  }
}

class Report with Logger, Printer {
  void generateReport() {
    log("start");
    printData("content");
    log("end");
  }
}

void main() {
  Report r = Report();
  r.log("request");
  r.printData("data");
  r.generateReport();
}
