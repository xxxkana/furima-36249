window.addEventListener('load', () =>{
 const itemPriceInput = document.getElementById("item-price");
   itemPriceInput.addEventListener("input", () => {
    const inputValue = itemPriceInput.value;
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML =Math.floor(inputValue * 0.1);
    const inputProfit = document.getElementById("profit");
    inputProfit.innerHTML =Math.floor(inputValue - addTax.innerHTML);
   })
});