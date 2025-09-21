class BankAccount{
    int _balance = 0;  // • Private variable _balance

    int get balance => _balance;  // • Getter for balance

    // • Setter to add money (only if amount > 0)
    set deposit(int balance){
      if(balance>0){
        _balance = balance;
      }
    }
}


void main(){
  BankAccount b1 = BankAccount();
  b1._balance = 1000;
  print(b1._balance);
}