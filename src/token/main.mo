import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";

actor Toker {
  let owner : Principal = Principal.fromText("f6qrt-qkftn-libgc-eoxaz-linrj-z6v2e-32ufw-6xzts-fki6u-5cs3w-sae");
  let totalSupply : Nat = 1000000000;
  let  symbol : Text = "DANG";

  var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
  balances.put(owner, totalSupply);

  public query func balanceOf(who : Principal) : async Nat {
    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };

    return balance;
  };

  public query func getSymbol() : async Text {
    return symbol;
  };

  public shared (msg) func payOut() : async Text {
    // Debug.print(debug_show (msg.caller));
    if (balances.get(msg.caller) == null) {
      let amount = 10000;
      let result = await transfer(msg.caller, amount);
      return "Success";
    } else {
      return "Already Claimed";
    };
  };

  public shared (msg) func transfer(to: Principal, amount: Nat) : async Text {
    let fromBalance = await balanceOf(msg.caller);
    if (fromBalance > amount) {
      let newFromBalance : Nat = fromBalance - amount;
      balances.put(msg.caller, newFromBalance);

      let toBalance = await balanceOf(to); 
      let newToBalance = toBalance + amount;
      balances.put(to, newToBalance);
 
      return "success";

    } else {
      return "Insufficient Funds";
    };
  };
};
