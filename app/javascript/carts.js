document.addEventListener("DOMContentLoaded", function() {
    // Add event listener to quantity input fields
    const quantityInputs = document.querySelectorAll(".quantity_input");
    quantityInputs.forEach(input => {
        input.addEventListener("input", function() {
            const productId = input.dataset.productId;
            const quantity = input.value;
            updateTotalPrice(productId, quantity);
        });
    });

    // Function to update total price dynamically
    function updateTotalPrice(productId, quantity) {
        const productPrice = parseFloat(document.querySelector(`#product_price_${productId}`).textContent);
        const totalPriceElement = document.querySelector(`#total_price_${productId}`);
        totalPriceElement.textContent = (productPrice * quantity).toFixed(2); // Update total price
    }
});

document.addEventListener("DOMContentLoaded", function() {
    // Function to fetch cart item count via AJAX
    function fetchCartItemCount() {
        fetch("/cart/item_count", {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
            }
        })
        .then(response => response.json())
        .then(data => {
            // Update cart item count
            document.getElementById("cartItemCount").textContent = data.totalItems;
        })
        .catch(error => console.error('Error:', error));
    }

    // Call fetchCartItemCount function on page load
    fetchCartItemCount();
});

