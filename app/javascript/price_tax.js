function price() {

  const priceInput = document.getElementById("item-price")
  const addTaxDisplay = document.getElementById("add-tax-price")
  const profitDisplay = document.getElementById("profit")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value
    addTaxDisplay.innerHTML = Math.floor(inputValue * 0.1)
    profitDisplay.innerHTML = Math.floor(inputValue * 0.9)
  })
}

window.addEventListener('load', price)  