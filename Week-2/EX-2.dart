class BankAccount {
  // TODO
  int id;
  String owner;
  double _balance = 0;

  BankAccount(this.id, this.owner);
  double get balance => _balance;

  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  // TODO
  String name;
  Map<int, BankAccount> accounts = {};

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exist!');
    }
    var account = BankAccount(accountId, accountOwner);
    accounts[accountId] = account;
    return account;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
