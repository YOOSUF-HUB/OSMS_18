<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Insert Stock Order</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    h2 {
      text-align: center;
      color: #343a40;
      font-weight: 600;
      margin-bottom: 30px;
    }

    form {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
    }

    label {
      font-weight: 500;
      color: #495057;
    }

    input[type="text"],
    input[type="date"],
    input[type="number"],
    select,
    textarea {
      border-radius: 6px !important;
      box-shadow: none !important;
      transition: border-color 0.3s ease;
    }

    input:focus,
    select:focus,
    textarea:focus {
      border-color: #0d6efd;
      box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
    }

    .form-label {
      margin-bottom: 6px;
    }

    .form-control,
    .form-select {
      padding: 10px;
    }

    textarea.form-control {
      resize: vertical;
    }

    .btn-primary {
      background-color: #0d6efd;
      border: none;
      padding: 10px 20px;
      font-weight: 500;
      border-radius: 6px;
    }

    .btn-primary:hover {
      background-color: #0b5ed7;
    }

    .btn-danger {
      margin-left: 10px;
    }

    .btn-danger:hover {
      background-color: #c82333;
    }

    .row.mb-3 {
      margin-bottom: 20px !important;
    }

    .container {
      max-width: 900px;
    }

    @media (max-width: 768px) {
      .btn {
        width: 100%;
        margin-top: 10px;
      }
    }
  </style>
  <script>
    function calculateTotal() {
      const qty = parseFloat(document.getElementById('quantity_ordered').value) || 0;
      const unit = parseFloat(document.getElementById('unit_price').value) || 0;
      document.getElementById('total_price').value = (qty * unit).toFixed(2);
    }
  </script>
</head>
<body>
  <div class="container mt-5">
    <h2 class="mb-4">Insert Stock Order</h2>
    <form action="../StockOrderInsertServlet" method="post">
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="order_date" class="form-label">Order Date</label>
          <input type="date" class="form-control" id="order_date" name="order_date">
        </div>
        <div class="col-md-6">
          <label for="expected_delivery_date" class="form-label">Expected Delivery Date</label>
          <input type="date" class="form-control" id="expected_delivery_date" name="expected_delivery_date">
        </div>
      </div>

      <div class="row mb-3">
        <div class="col-md-4">
          <label for="quantity_ordered" class="form-label">Quantity Ordered</label>
          <input type="number" class="form-control" id="quantity_ordered" name="quantity_ordered" oninput="calculateTotal()">
        </div>
        <div class="col-md-4">
          <label for="unit_price" class="form-label">Unit Price</label>
          <input type="number" step="0.01" class="form-control" id="unit_price" name="unit_price" oninput="calculateTotal()">
        </div>
        <div class="col-md-4">
          <label for="total_price" class="form-label">Total Price</label>
          <input type="number" step="0.01" class="form-control" id="total_price" name="total_price" readonly>
        </div>
      </div>

      <div class="row mb-3">
        <div class="col-md-6">
          <label for="order_status" class="form-label">Order Status</label>
          <input type="text" class="form-control" id="order_status" name="order_status">
        </div>
        <div class="col-md-6">
          <label for="payment_status" class="form-label">Payment Status</label>
          <input type="text" class="form-control" id="payment_status" name="payment_status">
        </div>
      </div>

      <div class="mb-3">
        <label for="notes" class="form-label">Notes</label>
        <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
      </div>

      <div class="row mb-3">
        <div class="col-md-6">
          <label for="received_date" class="form-label">Received Date</label>
          <input type="date" class="form-control" id="received_date" name="received_date">
        </div>
        <div class="col-md-6">
          <label for="invoice_number" class="form-label">Invoice Number</label>
          <input type="text" class="form-control" id="invoice_number" name="invoice_number">
        </div>
      </div>

      <div class="mb-3">
        <label for="supplier_id" class="form-label">Supplier</label>
        <select class="form-select" id="supplier_id" name="supplier_id">
          <option value="" selected disabled>Select Supplier</option>
          <option value="3">Eastern Electronics</option>
          <option value="5">MacroHardware Co</option>
          <!-- Add more suppliers as needed -->
        </select>
      </div>

      <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="../StockManagerDashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
      </div>
    </form>
  </div>
</body>
</html>
