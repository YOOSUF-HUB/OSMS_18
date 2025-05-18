<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TechNest - Wholesale Computer Parts</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;700&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <!-- Bootstrap CSS for login form -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    :root {
      --primary: #ffffff;
      --accent: #39ff14;
      --bg: #0d1117;
      --card-bg: #161b22;
      --text: #e0e0e0;
      --white: #ffffff;
      --head: #00fffb;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Orbitron', sans-serif;
      background: var(--bg);
      color: var(--text);
    }

    header {
      padding: 1.5rem 2rem;
      background: #0d1117;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid var(--primary);
    }

    header h1 {
      font-weight: 700;
      font-size: 1.6rem;
      color: var(--primary);
      text-shadow: 0 0 8px var(--primary);
    }

    nav a {
      margin-left: 1.5rem;
      text-decoration: none;
      font-weight: 600;
      color: var(--text);
      transition: color 0.3s;
    }

    nav a:hover {
      color: var(--accent);
    }

    .hero {
      background: linear-gradient(to right, rgb(0 255 255 / 38%), rgb(0 0 0 / 60%)),
                  url(https://images.unsplash.com/photo-1568209865332-a15790aed756?q=80&w=3540&auto=format&fit=crop) center / cover no-repeat;
      text-align: center;
      padding: 15rem 2rem;
      transition: transform 0.6s ease-in, background 0.6s ease-in;
      will-change: transform, background;
    }
    
    .hero:hover {
      transform: scale(1.007);
    }

    .hero h2 {
      font-size: 3rem;
      font-weight: 700;
      margin-bottom: 1rem;
      text-shadow: 0 0 10px var(--accent);
    }
    
    .hero h1 {
      font-size: 4rem;
      font-weight: 700;
      margin-bottom: 1rem;
      text-shadow: 0 0 10px var(--head);
    }

    .hero p {
      font-size: 1.2rem;
      opacity: 0.85;
      color: var(--text);
    }

    .section {
      padding: 4rem 2rem;
      max-width: 1100px;
      margin: 0 auto;
    }

    .section-title {
      text-align: center;
      font-size: 2.2rem;
      font-weight: 600;
      margin-bottom: 3rem;
      color: var(--accent);
      text-shadow: 0 0 10px var(--accent);
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 2rem;
    }

    .card {
      background: var(--card-bg);
      border: 1px solid var(--primary);
      border-radius: 12px;
      padding: 2rem 1rem;
      text-align: center;
      box-shadow: 0 0 10px rgba(0, 255, 255, 0.2);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 0 15px var(--accent);
    }

    .card i {
      font-size: 2.8rem;
      color: var(--primary);
      text-shadow: 0 0 5px var(--primary);
      margin-bottom: 1rem;
    }

    .card p {
      font-weight: 600;
      color: var(--white);
    }

    .form-wrapper {
      background: var(--card-bg);
      border: 1px solid var(--accent);
      padding: 2.5rem;
      border-radius: 16px;
      max-width: 600px;
      margin: 0 auto;
      box-shadow: 0 0 12px var(--accent);
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
      border: 1px solid var(--primary);
      border-radius: 8px;
      background: #0d1117;
      color: var(--white);
    }

    .form-wrapper label {
      position: absolute;
      top: 50%;
      left: 1rem;
      transform: translateY(-50%);
      background: var(--card-bg);
      padding: 0 0.25rem;
      font-size: 0.9rem;
      color: var(--primary);
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
      color: var(--accent);
    }

    .form-wrapper button {
      background: var(--accent);
      color: #000;
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
      font-weight: 700;
      font-family: 'Orbitron', sans-serif;
    }

    .form-wrapper button:hover {
      background: #0ff;
      color: #000;
    }

    footer {
      text-align: center;
      padding: 2rem 1rem;
      font-size: 0.9rem;
      color: #888;
    }

    @media (max-width: 600px) {
      .hero h2 {
        font-size: 2rem;
      }

      nav a {
        margin-left: 1rem;
      }
    }
    
    .video-container {
      max-width: 800px;
      margin: 0 auto 4rem;
      box-shadow: 0 0 20px var(--accent);
      border-radius: 12px;
      overflow: hidden;
    }

    .video-container video {
      width: 100%;
      height: auto;
      display: block;
      border: none;
    }

    .video-background {
      position: relative;
      width: 100%;
      height: 500px;
      overflow: hidden;
      border-radius: 12px;
      box-shadow: 0 0 20px var(--accent);
      margin-bottom: 4rem;
    }

    .video-background video {
      position: absolute;
      top: 50%;
      left: 50%;
      min-width: 100%;
      min-height: 100%;
      transform: translate(-50%, -50%);
      object-fit: cover;
      z-index: 1;
      opacity: 0.25;
    }

    .video-overlay {
      position: relative;
      z-index: 2;
      text-align: center;
      padding-top: 200px;
      color: var(--white);
    }

    .video-full-bg {
      position: relative;
      width: 100vw;
      height: 100vh;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .video-full-bg video {
      position: absolute;
      top: 50%;
      left: 50%;
      min-width: 100vw;
      min-height: 100vh;
      transform: translate(-50%, -50%);
      object-fit: cover;
      z-index: 1;
      opacity: 0.25;
    }

    .video-overlay-content {
      position: relative;
      z-index: 2;
      color: var(--accent);
      font-size: 2rem;
      text-shadow: 0 0 10px var(--accent);
      text-align: center;
    }

    .video-overlay-content p{
      position: relative;
      z-index: 2;
      color: var(--accent);
      font-size: 1rem;
      text-shadow: 0 0 10px var(--accent);
      text-align: center;
      margin-top:20px;
    }

    /* Login Card Styling (from your original login form) */
    .login-card {
      background-color: #ffffff;
      border-radius: 1rem;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 1000px;
      padding: 2.5rem 2rem;
      margin: 3rem auto;
      color: #1e293b;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .login-card h1 {
      font-weight: 700;
      letter-spacing: 1.5px;
      margin-bottom: 2rem;
      text-align: center;
      color: #4ade80; /* Use your accent color */
    }

    .form-label {
      font-weight: 600;
      color: #4ade80;
    }

    .btn-primary {
      background-color: #4ade80;
      border: none;
      font-weight: 700;
      padding: 0.75rem 1.3rem;
      width: 100%;
      border-radius: 0.5rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
      color: #000;
    }

    .btn-primary:hover {
      background-color: #22c55e;
      color: #fff;
    }

    .alert-danger {
      background-color: #7f1d1d;
      color: #fee2e2;
      font-weight: 600;
      border-radius: 0.375rem;
      padding: 0.75rem 1rem;
      margin-bottom: 1.25rem;
      text-align: center;
      border: 1px solid #fca5a5;
    }
  </style>
</head>

<body>
  <header>
    <h1>TechNest</h1>
    <nav>
      <a href="#hero">Home</a>
      <a href="#products">Products</a>
      <a href="#about">About</a>
      <a href="#contact">Contact</a>
      <a href="#login">Login</a>
    </nav>
  </header>

  <section class="hero" id="hero">
    <h1>TechNest</h1>
    <h2>Wholesale Computer Parts, Simplified</h2>
    <p>Powering IT businesses with high-performance components at scale.</p>
  </section>

  <!-- LOGIN FORM SECTION -->
  <section class="section" id="login" style="padding: 3rem 2rem;">
    <div class="login-card shadow-sm" style="background-color: var(--card-bg); color: var(--text);">
      <h1>Secure Login</h1>

      <form action="${pageContext.request.contextPath}/LoginServlet" method="post" novalidate>
        <% if (request.getAttribute("loginError") != null) { %>
          <div class="alert alert-danger" role="alert">
            <%= request.getAttribute("loginError") %>
          </div>
        <% } %>

        <div class="mb-4">
          <label for="gmail" class="form-label">Email Address</label>
          <input type="email" id="gmail" name="gmail" class="form-control" placeholder="your.email@example.com" required
                 style="background-color: #0d1117; border: 1px solid var(--accent); color: var(--text); font-weight: 500;" />
        </div>

        <div class="mb-4">
          <label for="password" class="form-label">Password</label>
          <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required
                 style="background-color: #0d1117; border: 1px solid var(--accent); color: var(--text); font-weight: 500;" />
        </div>

        <button type="submit" class="btn btn-primary" 
                onmouseover="this.style.backgroundColor='#00e600'" 
                onmouseout="this.style.backgroundColor='var(--accent)'">
          Sign In
        </button>
      </form>
    </div>
  </section>

  <section class="section" id="products">
    <h2 class="section-title">Our Products</h2>
    <div class="grid">
      <div class="card">
        <i class="fa-solid fa-microchip"></i>
        <p>Processors</p>
      </div>
      <div class="card">
        <i class="fa-solid fa-memory"></i>
        <p>RAM Modules</p>
      </div>
      <div class="card">
        <i class="fa-solid fa-desktop"></i>
        <p>Motherboards</p>
      </div>
      <div class="card">
        <i class="fa-solid fa-plug"></i>
        <p>Power Supplies</p>
      </div>
      <div class="card">
        <i class="fa-solid fa-sd-card"></i>
        <p>Storage Devices</p>
      </div>
      <div class="card">
        <i class="fa-solid fa-wifi"></i>
        <p>Networking</p>
      </div>
    </div>
  </section>

  <section class="section" id="about">
    <h2 class="section-title">About TechNest</h2>
    <p style="max-width: 700px; margin: 0 auto; text-align: center; line-height: 1.6;">
      TechNest is a premier distributor of wholesale computer parts, dedicated to providing businesses
      with cutting-edge technology and reliable components. Our mission is to simplify the supply chain,
      ensuring quality products, fast shipping, and competitive pricing.
    </p>
  </section>

  <section class="section" id="contact">
    <h2 class="section-title">Contact Us</h2>
    <form class="form-wrapper" action="${pageContext.request.contextPath}/ContactServlet" method="post" novalidate>
      <div class="field">
        <input type="text" name="name" id="name" placeholder=" " required/>
        <label for="name">Full Name</label>
      </div>
      <div class="field">
        <input type="email" name="email" id="email" placeholder=" " required/>
        <label for="email">Email Address</label>
      </div>
      <div class="field">
        <textarea name="message" id="message" rows="5" placeholder=" " required></textarea>
        <label for="message">Your Message</label>
      </div>
      <button type="submit">Send Message</button>
    </form>
  </section>

  <footer>
    &copy; 2025 TechNest. All rights reserved.
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
