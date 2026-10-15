class BankAccount {
    final int _accountId;
    String _owner;
    double _balance = 0.0;

    BankAccount({required this._accountId, required this._owner, required this._balance});

    int get accountId => _accountId;
    String get owner => _owner;

    double get balance => _balance ;

    void withdraw(double amount) {
        if (amount < 0) {
            throw Exception("Withdrawal amount cannot be negative!");
        }
        if (amount > _balance) {
            throw Exception("Insufficient balance for withdrawal!");
        }
        _balance -= amount;
    }

    void credit(double amount) {
        if (amount < 0) {
            throw Exception("Credit amount cannot be negative!");
        }
        _balance += amount;
    }

    void set setBalance(double newBalance) {
        if (newBalance < 0) {
            throw Exception("Balance cannot be negative!");
        }
        _balance = newBalance;
    }

}

class Bank {
    String _name;
    List<BankAccount> _accounts;
    
    Bank({required this._name, List<BankAccount>? accounts}) : _accounts = accounts ?? []; 

    
    String get name => _name;
    List<BankAccount> get accounts => _accounts;


    BankAccount createAccount(int accountId, String owner) {
        
        if (_accounts.any((a) => a.accountId == accountId)) {
            throw Exception("Account with ID $accountId already exists!");
        }
           
        BankAccount newAccount = BankAccount(accountId: accountId, owner: owner, balance: 0.0);
        _accounts.add(newAccount);
        return newAccount;
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
