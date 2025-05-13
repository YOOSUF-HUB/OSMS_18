<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TechNest - Wholesale Computer Parts</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    :root {
      --primary: #0f172a;
      --accent: #38bdf8;
      --bg: #f1f5f9;
      --text: #1e293b;
      --white: #ffffff;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: var(--bg);
      color: var(--text);
    }

    header {
      padding: 1.5rem 2rem;
      background: var(--white);
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
      position: sticky;
      top: 0;
      z-index: 10;
    }

    header h1 {
      font-weight: 700;
      font-size: 1.6rem;
      color: var(--primary);
    }

    nav a {
      margin-left: 1.5rem;
      text-decoration: none;
      font-weight: 500;
      color: var(--text);
    }

    .hero {
      background: linear-gradient(to right, #0f172a, #1e293b);
      color: var(--white);
      text-align: center;
      padding: 6rem 2rem;
    }

    .hero h2 {
      font-size: 2.8rem;
      font-weight: 700;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.2rem;
      opacity: 0.85;
    }

    .section {
      padding: 4rem 2rem;
      max-width: 1100px;
      margin: 0 auto;
    }

    .section-title {
      text-align: center;
      font-size: 2rem;
      font-weight: 600;
      margin-bottom: 3rem;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 2rem;
    }

    .card {
      background: white;
      border-radius: 12px;
      padding: 2rem 1rem;
      text-align: center;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card i {
      font-size: 2.5rem;
      color: var(--accent);
      margin-bottom: 1rem;
    }

    .card p {
      font-weight: 500;
    }

    .form-wrapper {
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(12px);
      padding: 2.5rem;
      border-radius: 16px;
      max-width: 600px;
      margin: 0 auto;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
    }

    .form-wrapper .field {
      position: relative;
      margin-bottom: 1.8rem;
    }

    .form-wrapper input,
    .form-wrapper textarea {
      width: 100%;
      padding: 1rem;
      font-size: 1rem;
      border: 1px solid #cbd5e1;
      border-radius: 8px;
      outline: none;
      background: white;
    }

    .form-wrapper label {
      position: absolute;
      top: 50%;
      left: 1rem;
      transform: translateY(-50%);
      background: white;
      padding: 0 0.25rem;
      font-size: 0.9rem;
      color: #6b7280;
      pointer-events: none;
      transition: 0.2s ease;
    }

    .form-wrapper input:focus + label,
    .form-wrapper input:not(:placeholder-shown) + label,
    .form-wrapper textarea:focus + label,
    .form-wrapper textarea:not(:placeholder-shown) + label {
      top: -0.6rem;
      left: 0.75rem;
      font-size: 0.75rem;
      color: var(--primary);
    }

    .form-wrapper button {
      background: var(--primary);
      color: white;
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.2s ease;
    }

    .form-wrapper button:hover {
      background: #1e293b;
    }

    footer {
      text-align: center;
      padding: 2rem 1rem;
      font-size: 0.9rem;
      color: #64748b;
    }

    @media (max-width: 600px) {
      .hero h2 {
        font-size: 2rem;
      }

      nav a {
        margin-left: 1rem;
      }
    }
  </style>
</head>
<body>


<header>
  <h1>TechNest</h1>
  <nav>
    <a href="#products">Products</a>
    <a href="#contact">Contact</a>
  </nav>
</header>

<section class="hero">
  <h2>Wholesale Computer Parts, Simplified</h2>
  <p>Powering IT businesses with high-performance components at scale.</p>
</section>

<section class="section" id="products">
  <h3 class="section-title">Product Categories</h3>
  <div class="grid">
    <div class="card"><i class="fas fa-microchip"></i><p>Processors</p></div>
    <div class="card"><i class="fas fa-memory"></i><p>RAM Modules</p></div>
    <div class="card"><i class="fas fa-hdd"></i><p>Storage Drives</p></div>
    <div class="card"><i class="fas fa-video"></i><p>Graphics Cards</p></div>
    <div class="card"><i class="fas fa-plug"></i><p>Power Supplies</p></div>
    <div class="card"><i class="fas fa-network-wired"></i><p>Networking</p></div>
  </div>
</section>

<section class="section" id="contact">
  <h3 class="section-title">Contact Our Sales Team</h3>
  <form class="form-wrapper" id="contactForm">
    <div class="field">
      <input type="text" id="name" required placeholder=" "/>
      <label for="name">Full Name</label>
    </div>
    <div class="field">
      <input type="email" id="email" required placeholder=" "/>
      <label for="email">Email Address</label>
    </div>
    <div class="field">
      <textarea id="message" rows="5" required placeholder=" "></textarea>
      <label for="message">Your Message</label>
    </div>
    <button type="submit">Send Message</button>
  </form>
</section>

<footer>
  &copy; 2025 TechNest. All rights reserved. Wholesale only.
</footer>

<script>
  document.getElementById("contactForm").addEventListener("submit", function(e) {
    e.preventDefault();
    alert("Thanks for contacting TechNest! Our sales team will reach out shortly.");
    this.reset();
  });
</script>

</body>
</html>
