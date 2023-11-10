<%
const cartItems = [];

// Get a reference to the cart table and total price element
const cartTable = document.getElementById("cart-table");
const totalPriceElement = document.getElementById("total-price");

// Function to update the cart table and total price
function updateCartTable() {
    // Clear the existing rows in the table body
    const tbody = cartTable.querySelector("tbody");
    tbody.innerHTML = "";

    // Initialize the total cost
    let totalCost = 0;

    // Iterate through the selected items and add them to the table
    for (const item of cartItems) {
        const row = document.createElement("tr");
        const itemName = document.createElement("td");
        itemName.textContent = item.name;
        const itemPrice = document.createElement("td");
        itemPrice.textContent = `$${item.price}`;
        row.appendChild(itemName);
        row.appendChild(itemPrice);
        tbody.appendChild(row);

        // Update the total cost
        totalCost += item.price;
    }

    // Update the total price element
    totalPriceElement.textContent = `$${totalCost}`;
}

// Modify the event listener for "Add to cart" links
const addToCartLinks = document.querySelectorAll(".content a[href='cart.html']");
addToCartLinks.forEach(link => {
    link.addEventListener("click", function(event) {
        event.preventDefault(); // Prevent the default link behavior

        // Get the product name and price from the parent element
        const productBox = link.closest(".box");
        const productName = productBox.querySelector("h3").textContent;
        const productPrice = parseFloat(productBox.querySelector(".content span").textContent.replace("$", ""));

        // Add the selected item to the cartItems array
        cartItems.push({ name: productName, price: productPrice });

        // Update the cart table and total price
        updateCartTable();
    });
});
%>