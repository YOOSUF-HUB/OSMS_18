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
  <style>
    :root {
      --primary: #0ff;
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
      padding: 20rem 4rem;
      color: var(--white);
      transition: background 0.6s ease-in, padding 0.6s ease-in;
    }
    
    .hero:hover {
      background: linear-gradient(to right, rgb(0 255 255 / 38%), rgb(0 0 0)),
      			url(https://images.unsplash.com/photo-1568209865332-a15790aed756?q=80&w=3540&auto=format&fit=crop) center / cover no-repeat;

      text-align: center;
      padding: 20rem 4rem;
      color: var(--white);
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
  opacity: 0.25; /* adjust for visibility */
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

  </style>
</head>
<body>

<header>
  <h1>TechNest</h1>
  <nav>
    <a href="#contact">Contact</a>
    <a href="user/login.jsp">Log In</a>
  </nav>
</header>

<section class="hero">
	<h1>TechNest</h1>
  <h2>Wholesale Computer Parts, Simplified</h2>
  <p>Powering IT businesses with high-performance components at scale.</p>
</section>

<section class="section" id="products">
  <h3 class="section-title">What We Have</h3>
  <div class="grid">
    <div class="card"><i class="fas fa-microchip"></i><p>Processors</p></div>
    <div class="card"><i class="fas fa-memory"></i><p>RAM Modules</p></div>
    <div class="card"><i class="fas fa-hdd"></i><p>Storage Drives</p></div>
    <div class="card"><i class="fas fa-video"></i><p>Graphics Cards</p></div>
    <div class="card"><i class="fas fa-plug"></i><p>Power Supplies</p></div>
    <div class="card"><i class="fas fa-network-wired"></i><p>Networking</p></div>
    <div class="card"><i class="fas fa-desktop"></i><p>Monitors</p></div>
	<div class="card"><i class="fas fa-fan"></i><p>Cooling Fans</p></div>
	<div class="card"><i class="fas fa-bolt"></i><p>Power Management</p></div>
	<div class="card"><i class="fas fa-keyboard"></i><p>Keyboards</p></div>
	<div class="card"><i class="fas fa-mouse"></i><p>Mice</p></div>
	<div class="card"><i class="fas fa-headphones"></i><p>Headsets</p></div>
	<div class="card"><i class="fas fa-server"></i><p>Servers</p></div>
	<div class="card"><i class="fas fa-laptop-code"></i><p>Laptops</p></div>
	<div class="card"><i class="fas fa-usb"></i><p>USB Devices</p></div>

  </div>
</section>

<section class="video-full-bg">
  <video autoplay muted loop playsinline>
    <source src="Video/GeForce RTX 4090 - Official Trailer - IGN (1080p, h264).mp4" type="video/mp4" />
  </video>
<div class="video-overlay-content">
  <h3>Unleash Ultimate Graphics Power</h3>
  <p>Experience the future of performance with the GeForce RTX 4090 — where speed meets stunning realism. Built for gamers, creators, and power users.</p>
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


<section class="video-full-bg">
  <video autoplay muted loop playsinline>
    <source src="Video/AORUS MASTER Series Laptop  OWN THE GAME  Official Trailer - GIGABYTE (1080p, h264).mp4" type="video/mp4" />
    
  </video>
<div class="video-overlay-content">
  <h3>Built for Power. Engineered for Victory.</h3>
  <p>TechNest delivers the ultimate performance gear for system builders, gamers, and pros who demand dominance.</p>
</div>
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
