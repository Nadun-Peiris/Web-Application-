// Function to handle the payment method change and show the tooltip
function handlePaymentChange() {
    const paymentMethodSelect = document.getElementById("payment-method");
    const tooltip = document.getElementById("tooltip");
    
    // Get the selected payment method option and its tooltip
    const selectedOption = paymentMethodSelect.options[paymentMethodSelect.selectedIndex];
    const tooltipText = selectedOption.getAttribute("data-tooltip");
    
    // Update the tooltip text and display it
    tooltip.textContent = tooltipText;
    tooltip.style.display = "block";  // Show the tooltip
}

// Function to handle the button click for payment processing
function proceedToPayment() {
    const paymentMethod = document.getElementById("payment-method").value;
    
    if (!paymentMethod) {
        alert("Please select a payment method.");
        return;
    }

    // Simulate proceeding to payment
    alert(Proceeding to payment with ${paymentMethod.charAt(0).toUpperCase() + paymentMethod.slice(1)}.);
    
    // For real-world scenarios, here you would trigger a payment gateway.
    // For now, simulate success:
    setTimeout(function() {
        alert("Payment Successful! Your tickets are confirmed.");
        window.location.href = "confirmation.html";  // Redirect to confirmation page
    }, 2000);
}
