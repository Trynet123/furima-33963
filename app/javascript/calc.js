function calc() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    // console.log(itemPrice.value);
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const priceVal = itemPrice.value;
    const feeVal = Math.floor(priceVal * 0.1);
    const profitVal = Math.floor(priceVal - feeVal);
    fee.innerHTML = feeVal;
    profit.innerHTML = profitVal;
  });
}

window.addEventListener('load', calc);