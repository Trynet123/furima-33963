function calc() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    // console.log(itemPrice.value);
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const priceVal = itemPrice.value;
    fee = priceVal * 0.1;
    profit = priceVal + fee;
    fee.innerHTML = `${fee}`;
  });
}

window.addEventListener('load', calc);