document.addEventListener("DOMContentLoaded", function() {
    let cart = [];

    // Function to add an item to the cart
    function addToCart(itemName, itemPrice) {
        cart.push({ name: itemName, price: itemPrice });
        updateCartTable();
    }

    // Function to calculate and update the cart table
    function updateCartTable() {
        const cartTableBody = document.querySelector('tbody');
        const totalPriceCell = document.getElementById('total-price');
        let totalPrice = 0;

        // Clear the existing table
        cartTableBody.innerHTML = '';

        // Populate the table with cart items
        cart.forEach((item) => {
            const row = document.createElement('tr');
            const itemNameCell = document.createElement('td');
            const itemPriceCell = document.createElement('td');

            itemNameCell.textContent = item.name;
            itemPriceCell.textContent = '$' + item.price.toFixed(2);

            row.appendChild(itemNameCell);
            row.appendChild(itemPriceCell);
            cartTableBody.appendChild(row);

            // Add item price to the total
            totalPrice += item.price;
        });

        // Update the total price
        totalPriceCell.textContent = '$' + totalPrice.toFixed(2);
    }

    // Event listener for "Add to cart" links on index.html
    document.querySelectorAll('.add-to-cart-link').forEach((link) => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const itemName = event.target.dataset.name;
            const itemPrice = parseFloat(event.target.dataset.price);

            addToCart(itemName, itemPrice);
        });
    });
});
