import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function () {
  update();
})

document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();
  
  const button = event.target.querySelector("#submit-btn");

  
  const inputAmount = parseFloat(document.getElementById("input-amount").value);//parsefloat method is used to convert the interger to float number
  const outputAmount = parseFloat(document.getElementById("withdraw-amount").value);
  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
  }
  if (document.getElementById("withdraw-amount").value.length != 0) {
    await dbank.withdrawl(outputAmount);
  }
  await dbank.compount();
  update();
  
  
  document.getElementById("input-amount").value = "";
  document.getElementById("withdraw-amount").value = "";
  button.removeAttribute("disabled");
});
async function update(){
const currentAmount = await dbank.checkBalance(); // awit is to wait for the result to come back
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100; //round and multiply woth 100 for 2 decimal values
 };
