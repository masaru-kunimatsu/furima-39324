window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxDomPrice = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = addTaxDomPrice
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue - addTaxDomPrice)
  })
});
