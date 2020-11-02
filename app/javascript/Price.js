function Price(){
  const itemPriceObj = document.getElementById("item-price");
  itemPriceObj.addEventListener("input",()=> {
    const itemPrice = itemPriceObj.value
    const fee = Math.floor(itemPrice * 0.1)
    const profit = itemPrice - fee
    const feeObj = document.getElementById("add-tax-price");
    const profitObj = document.getElementById("profit");
    
    feeObj.innerText = fee.toLocaleString()
    profitObj.innerText = profit.toLocaleString()

  })
}

window.addEventListener("load",Price);