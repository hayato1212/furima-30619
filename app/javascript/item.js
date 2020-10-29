window.addEventListener('load', function(){
  const priceField = document.getElementById("item-price");
  const feeField = document.getElementById('add-tax-price');
  const profitField = document.getElementById("profit");

  priceField.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    fee = price * 0.1;
    profit = price - fee;
    feeField.textContent = fee;
    profitField.textContent = profit;
  });
});
