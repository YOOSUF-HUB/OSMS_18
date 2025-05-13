<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TechNest | Wholesale Computer Parts</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f7f9fc;
      color: #1a1a1a;
    }

    header {
      background: #ffffff;
      padding: 2rem 1rem;
      text-align: center;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    header h1 {
      margin-bottom: 0.5rem;
      font-size: 2.5rem;
      color: #0073e6;
    }

    header p {
      font-size: 1.1rem;
      color: #555;
    }

    .hero {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 3rem 1rem;
      text-align: center;
    }

    .hero h2 {
      font-size: 2rem;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.1rem;
      max-width: 600px;
      margin-bottom: 2rem;
    }

    .cta-button {
      background-color: #0073e6;
      color: #fff;
      padding: 0.8rem 1.5rem;
      border: none;
      border-radius: 5px;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
      text-decoration: none;
    }

    .cta-button:hover {
      background-color: #005bb5;
    }

    .product-images {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 2rem;
      margin-top: 3rem;
    }

    .product {
      width: 200px;
      animation: float 4s ease-in-out infinite;
      transition: transform 0.3s ease;
    }

    .product img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-15px);
      }
    }
    
	.product {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}


    footer {
      text-align: center;
      padding: 2rem;
      color: #888;
      font-size: 0.9rem;
    }
    
	.product-images {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: center;
	  gap: 3rem;
	  margin-top: 3rem;
	}
	
	.product {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  text-align: center;
	  animation: float 4s ease-in-out infinite;
	  color: #333;
	}
	
	.product p {
	  margin-top: 0.8rem;
	  font-weight: 500;
	  font-size: 1.1rem;
	}

  </style>
</head>
<body>
  <header>
    <h1>TechNest</h1>
    <p>Your Source for Reliable Wholesale Computer Components</p>
  </header>

  <section class="hero">
    <h2>Premium Parts. Competitive Prices. Trusted by Tech Professionals.</h2>
    <p>At TechNest, we supply high-performance computer components in bulk for resellers, repair shops, and enterprise IT departments. Enjoy unmatched quality, fast shipping, and top-tier support.</p>
    <a href="#contact" class="cta-button">Get a Quote</a>

	<div class="product-images">
	  <div class="product">
	    <i class="fas fa-microchip fa-4x" style="color: #0073e6;"></i>
	    <p>Motherboards</p>
	  </div>
	  <div class="product">
	    <i class="fas fa-video fa-4x" style="color: #0073e6;"></i>
	    <p>Graphics Cards</p>
	  </div>
	  <div class="product">
	    <i class="fas fa-memory fa-4x" style="color: #0073e6;"></i>
	    <p>Memory (RAM)</p>
	  </div>
	  <div class="product">
	    <i class="fas fa-microchip fa-4x" style="color: #0073e6;"></i>
	    <p>Motherboards</p>
	  </div>
	  <div class="product">
	    <i class="fas fa-video fa-4x" style="color: #0073e6;"></i>
	    <p>Graphics Cards</p>
	  </div>
	  <div class="product">
	    <i class="fas fa-memory fa-4x" style="color: #0073e6;"></i>
	    <p>Memory (RAM)</p>
	  </div>
	  
	</div>
  </section>

  <footer>
    <p>© 2025 TechNest. All rights reserved.</p>
  </footer>

  <script>
    // Placeholder for future functionality
    console.log("TechNest site loaded.");
  </script>
</body>
</html>
