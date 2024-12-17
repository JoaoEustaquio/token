import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap"; 

actor Toker {
  var owner : Principal = Principal.fromText("f6qrt-qkftn-libgc-eoxaz-linrj-z6v2e-32ufw-6xzts-fki6u-5cs3w-sae");
  var totalSupply : Nat = 1000000000;
  var symbol : Text = "DANG";

  var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash); 
  balances.put(owner, totalSupply); 

  public query func balanceOf(who: Principal) : async Nat {
    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result; 
    };

    return balance;
  };

  public query func getSymbol() : async Text {
    return symbol;
  }
} 