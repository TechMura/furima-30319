function Price(){
  const itemPriceObj = document.getElementById("item-price");
  itemPriceObj.addEventListener("keyup",()=> {
    const itemPrice = itemPriceObj.value
    const fee = Math.ceil(itemPrice * 0.1)
    const profit = itemPrice - fee
    const feeObj = document.getElementById("add-tax-price");
    const profitObj = document.getElementById("profit");
    
    feeObj.innerText = fee
    profitObj.innerText = profit

  })
}

window.addEventListener("load",Price)