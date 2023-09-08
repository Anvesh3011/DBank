import Debug "mo:base/Debug";//importing debug
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var availableBalance : Float = 300;
  availableBalance := 300;
  stable var startTime = Time.now();
   startTime := Time.now();
  // let id = 123456;
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));
  Debug.print(debug_show(startTime));

  public func topUp(amount :Float){
    availableBalance += amount;
    Debug.print(debug_show(availableBalance));
    
  };
  
 public func withdrawl(wamount:Float){
  let tempValue: Float = availableBalance - wamount;
  if(tempValue >= 0)
  {
      availableBalance -= wamount;
      Debug.print(debug_show(availableBalance));
  }else{
     Debug.print("Amout to large available balance is less than zero");
  }
 };
 public query func checkBalance(): async Float{
      return availableBalance;
 };
 public func compount(){
  let currentTime = Time.now();
  var timeElapsedNS = currentTime - startTime;
  var timeElapsedS = timeElapsedNS / 1000000000;
  availableBalance := availableBalance * (1.01 ** Float.fromInt( timeElapsedS));
  startTime := currentTime;
 };

 /// create a update function so the repetition of code is taken out
 
}