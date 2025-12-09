<?php
// index.php
session_start();
$page_title = "QuickCarz - Premium Car Rentals in Sri Lanka";
require_once 'includes/header.php';
?>

<style>
/* ====================================
   HERO SECTION WITH BACKGROUND IMAGE
   ==================================== */

.hero-section-modern {
    position: relative;
    min-height: 100vh;
    display: flex;
    align-items: center;
    overflow: hidden;
}

/* Background Image Layer */
.hero-background-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    z-index: 0;
}

/* Gradient Overlay on top of image */
.hero-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, rgba(59, 130, 246, 0.92) 0%, rgba(139, 92, 246, 0.92) 100%);
    z-index: 1;
}

/* Make sure content is above background and overlay */
.hero-container {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.hero-content-modern {
    position: relative;
    z-index: 2;
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

/* Floating shapes stay on top */
.floating-shape {
    position: absolute;
    z-index: 2;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
}

.shape-1 {
    width: 300px;
    height: 300px;
    top: 10%;
    left: 5%;
    animation: float 20s infinite ease-in-out;
}

.shape-2 {
    width: 200px;
    height: 200px;
    bottom: 15%;
    right: 10%;
    animation: float 15s infinite ease-in-out reverse;
}

.shape-3 {
    width: 150px;
    height: 150px;
    top: 60%;
    left: 15%;
    animation: float 18s infinite ease-in-out;
}

@keyframes float {
    0%, 100% {
        transform: translateY(0) translateX(0) rotate(0deg);
    }
    33% {
        transform: translateY(-30px) translateX(20px) rotate(5deg);
    }
    66% {
        transform: translateY(20px) translateX(-20px) rotate(-5deg);
    }
}

/* Ensure all text is white and readable on dark overlay */
.hero-content-modern * {
    color: white !important;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

.hero-title-modern {
    text-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
}

.hero-description {
    text-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
    font-weight: 500;
}

.hero-badge-modern {
    background: rgba(255, 255, 255, 0.25);
    backdrop-filter: blur(10px);
    padding: 10px 20px;
    border-radius: 50px;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.hero-stats-modern {
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

/* Button Styles */
.hero-buttons-modern {
    display: flex;
    gap: 20px;
    justify-content: center;
    flex-wrap: wrap;
    margin: 40px 0;
}

.btn-modern:hover {
    transform: translateY(-3px);
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.25) !important;
    border-color: white !important;
}

.btn-primary-modern:hover {
    box-shadow: 0 8px 24px rgba(255, 255, 255, 0.2) !important;
}

.btn-secondary-modern:hover {
    box-shadow: 0 8px 24px rgba(255, 255, 255, 0.2) !important;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .hero-section-modern {
        min-height: 80vh;
    }
    
    .hero-background-image {
        background-position: center center;
    }
    
    .floating-shape {
        display: none;
    }
}
</style>

<!-- Modern Hero Section with Background Image -->
<section class="hero-section-modern">
    <!-- Background Image Layer - CHANGE THIS URL TO YOUR IMAGE -->
    <div class="hero-background-image" style="background-image: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=1920');"></div>
    <div class="hero-overlay"></div>
    <div class="container hero-container">
        <div class="hero-content-modern">
            <div class="hero-badge-modern">
                <svg class="badge-icon" width="20" height="20" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6z"/>
                </svg>
                <span>Sri Lanka's #1 Car Rental Service</span>
            </div>
            <h1 class="hero-title-modern">
                Drive Your Dreams in   
               <br> <span class="highlight-gradient" style="color: #FFA500 !important; text-shadow: 0 4px 8px rgba(255, 165, 0, 0.5);">Sri Lanka</span>
            </h1>
            <p class="hero-description">Experience luxury, comfort, and reliability with QuickCarz. From economy sedans to premium SUVs, we have the perfect vehicle for every journey across the island.</p>
            
            <div class="hero-buttons-modern">
                <a href="customer/vehicles/browse.php" class="btn-modern btn-primary-modern" style="background: rgba(255, 255, 255, 0.15); color: white; font-weight: 700; padding: 18px 40px; border-radius: 12px; text-decoration: none; display: inline-flex; align-items: center; gap: 12px; border: 2px solid white; backdrop-filter: blur(10px); box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3); transition: all 0.3s; font-size: 17px;">
                    Explore Our Fleet
                </a>
                <a href="register.php" class="btn-modern btn-secondary-modern" style="background: rgba(255, 255, 255, 0.15); color: white; font-weight: 700; padding: 18px 40px; border-radius: 12px; text-decoration: none; display: inline-flex; align-items: center; gap: 12px; border: 2px solid white; backdrop-filter: blur(10px); box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3); transition: all 0.3s; font-size: 17px;">
                    Get Started Free
                </a>
            </div>

            <div class="hero-stats-modern">
                <div class="stat-item">
                    <div class="stat-number-modern">500+</div>
                    <div class="stat-label-modern">Happy Customers</div>
                </div>
                <div class="stat-divider"></div>
                <div class="stat-item">
                    <div class="stat-number-modern">50+</div>
                    <div class="stat-label-modern">Premium Vehicles</div>
                </div>
                <div class="stat-divider"></div>
                <div class="stat-item">
                    <div class="stat-number-modern">24/7</div>
                    <div class="stat-label-modern">Support Available</div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Floating Elements -->
    <div class="floating-shape shape-1"></div>
    <div class="floating-shape shape-2"></div>
    <div class="floating-shape shape-3"></div>
</section>

<!-- Trust Badges -->
<section class="trust-badges">
    <div class="container">
        <div class="badges-scroll">
            <div class="badge-item">✓ Fully Insured</div>
            <div class="badge-item">✓ 24/7 Support</div>
            <div class="badge-item">✓ No Hidden Fees</div>
            <div class="badge-item">✓ Best Price Guarantee</div>
            <div class="badge-item">✓ Instant Confirmation</div>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section class="process-section-modern">
    <div class="container">
        <div class="section-header-modern">
            <span class="section-label">Simple Process</span>
            <h2 class="section-title-modern">Rent a Car in <span class="highlight-gradient">4 Easy Steps</span></h2>
            <p class="section-description">Get on the road in minutes with our streamlined booking process</p>
        </div>
        
        <div class="process-timeline">
            <div class="process-step-modern">
                <div class="step-number-modern">
                    <span>01</span>
                </div>
                <div class="step-content-modern">
                    <h3>Browse & Select</h3>
                    <p>Choose your perfect vehicle from our extensive fleet. Filter by type, price, or features to find exactly what you need.</p>
                </div>
                <div class="step-connector"></div>
            </div>

            <div class="process-step-modern">
                <div class="step-number-modern">
                    <span>02</span>
                </div>
                <div class="step-content-modern">
                    <h3>Book Instantly</h3>
                    <p>Complete your booking online in under 2 minutes. Receive instant confirmation via email and SMS.</p>
                </div>
                <div class="step-connector"></div>
            </div>

            <div class="process-step-modern">
                <div class="step-number-modern">
                    <span>03</span>
                </div>
                <div class="step-content-modern">
                    <h3>Pick Up Your Car</h3>
                    <p>Visit our location with your documents. Quick verification and you're ready to drive away!</p>
                </div>
                <div class="step-connector"></div>
            </div>

            <div class="process-step-modern">
                <div class="step-number-modern">
                    <span>04</span>
                </div>
                <div class="step-content-modern">
                    <h3>Drive & Enjoy</h3>
                    <p>Hit the road with confidence. Our 24/7 support team is always here if you need assistance.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials-section-modern">
    <div class="container">
        <div class="section-header-modern">
            <span class="section-label">Customer Reviews</span>
            <h2 class="section-title-modern">Loved by <span class="highlight-gradient">Thousands</span></h2>
            <p class="section-description">See what our customers have to say about their experience</p>
        </div>
        
        <div class="testimonials-grid-modern">
            <div class="testimonial-card-modern">
                <div class="testimonial-rating">
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                </div>
                <p class="testimonial-text">"Exceptional service from start to finish! The booking was seamless, and the vehicle was spotless. QuickCarz made our family vacation truly memorable."</p>
                <div class="testimonial-author-modern">
                    <div class="author-avatar-modern">KP</div>
                    <div class="author-details">
                        <strong>Kamal Perera</strong>
                        <span>Colombo · Economy Sedan</span>
                    </div>
                </div>
            </div>

            <div class="testimonial-card-modern">
                <div class="testimonial-rating">
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                </div>
                <p class="testimonial-text">"Best car rental experience in Sri Lanka! Professional team, competitive prices, and the premium sedan was absolutely worth it for my business trip."</p>
                <div class="testimonial-author-modern">
                    <div class="author-avatar-modern">NS</div>
                    <div class="author-details">
                        <strong>Nimal Silva</strong>
                        <span>Kandy · Premium Sedan</span>
                    </div>
                </div>
            </div>

            <div class="testimonial-card-modern">
                <div class="testimonial-rating">
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                    <span class="star-icon">⭐</span>
                </div>
                <p class="testimonial-text">"The 24/7 support is incredible! Had a minor issue late at night, and they responded within minutes. Truly customer-focused service!"</p>
                <div class="testimonial-author-modern">
                    <div class="author-avatar-modern">SJ</div>
                    <div class="author-details">
                        <strong>Sarah Johnson</strong>
                        <span>Tourist · SUV Rental</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="testimonial-stats">
            <div class="stat-box">
                <div class="stat-value">4.9/5</div>
                <div class="stat-label">Average Rating</div>
            </div>
            <div class="stat-box">
                <div class="stat-value">500+</div>
                <div class="stat-label">5-Star Reviews</div>
            </div>
            <div class="stat-box">
                <div class="stat-value">98%</div>
                <div class="stat-label">Would Recommend</div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section-modern">
    <div class="container">
        <div class="cta-content-modern">
            <div class="cta-badge">Limited Time Offer</div>
            <h2 class="cta-title">Ready to Start Your Journey?</h2>
            <p class="cta-description">Join thousands of satisfied customers who trust QuickCarz for their transportation needs. Book now and get 10% off your first rental!</p>
            <div class="cta-buttons-modern">
                <a href="register.php" class="btn-cta-primary">
                    Get Started Today
                </a>
                <a href="customer/vehicles/browse.php" class="btn-cta-secondary">
                    Browse Our Fleet
                </a>
            </div>
            <div class="cta-trust-indicators">
                <span>✓ No credit card required</span>
                <span>✓ Cancel anytime</span>
                <span>✓ Instant confirmation</span>
            </div>
        </div>
    </div>
</section>

<?php require_once 'includes/footer.php'; ?>