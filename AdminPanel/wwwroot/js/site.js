// Theme Management
class ThemeManager {
    constructor() {
        this.themeKey = 'admin-panel-theme';
        this.init();
    }

    init() {
        // Load saved theme
        const savedTheme = localStorage.getItem(this.themeKey);
        if (savedTheme === 'dark') {
            this.enableDarkMode();
        }

        // Setup theme toggle
        const themeToggle = document.getElementById('theme-toggle');
        if (themeToggle) {
            themeToggle.addEventListener('click', (e) => {
                e.preventDefault();
                this.toggleTheme();
            });
        }
    }

    toggleTheme() {
        const body = document.body;
        const isDark = body.classList.contains('dark-mode');
        
        if (isDark) {
            this.enableLightMode();
        } else {
            this.enableDarkMode();
        }
    }

    enableDarkMode() {
        document.body.classList.add('dark-mode');
        this.updateThemeIcon('fas fa-sun');
        localStorage.setItem(this.themeKey, 'dark');
        
        // Update AdminLTE classes for dark mode
        const navbar = document.querySelector('.main-header.navbar');
        if (navbar) {
            navbar.classList.remove('navbar-white', 'navbar-light');
            navbar.classList.add('navbar-dark');
        }
    }

    enableLightMode() {
        document.body.classList.remove('dark-mode');
        this.updateThemeIcon('fas fa-moon');
        localStorage.setItem(this.themeKey, 'light');
        
        // Update AdminLTE classes for light mode
        const navbar = document.querySelector('.main-header.navbar');
        if (navbar) {
            navbar.classList.remove('navbar-dark');
            navbar.classList.add('navbar-white', 'navbar-light');
        }
    }

    updateThemeIcon(iconClass) {
        const themeIcon = document.getElementById('theme-icon');
        if (themeIcon) {
            themeIcon.className = iconClass;
        }
    }
}

// Dashboard Animations
class DashboardAnimations {
    constructor() {
        this.init();
    }

    init() {
        this.animateCards();
        this.setupCardHovers();
    }

    animateCards() {
        const cards = document.querySelectorAll('.small-box');
        cards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                card.style.transition = 'all 0.5s ease';
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 100);
        });
    }

    setupCardHovers() {
        const cards = document.querySelectorAll('.small-box');
        cards.forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.transform = 'translateY(-5px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(0) scale(1)';
            });
        });
    }
}

// Notification System
class NotificationManager {
    constructor() {
        this.container = this.createContainer();
    }

    createContainer() {
        const container = document.createElement('div');
        container.id = 'notification-container';
        container.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            max-width: 300px;
        `;
        document.body.appendChild(container);
        return container;
    }

    show(message, type = 'info', duration = 5000) {
        const notification = document.createElement('div');
        notification.className = `alert alert-${type} alert-dismissible fade show`;
        notification.style.cssText = `
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            animation: slideInRight 0.3s ease;
        `;
        
        notification.innerHTML = `
            ${message}
            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span>
            </button>
        `;

        this.container.appendChild(notification);

        // Auto remove
        setTimeout(() => {
            if (notification.parentNode) {
                notification.style.animation = 'slideOutRight 0.3s ease';
                setTimeout(() => {
                    if (notification.parentNode) {
                        notification.remove();
                    }
                }, 300);
            }
        }, duration);
    }
}

// Utility Functions
class Utils {
    static formatNumber(num) {
        return new Intl.NumberFormat('ru-RU').format(num);
    }

    static formatCurrency(amount) {
        return new Intl.NumberFormat('ru-RU', {
            style: 'currency',
            currency: 'RUB'
        }).format(amount);
    }

    static formatDate(date) {
        return new Intl.DateTimeFormat('ru-RU').format(new Date(date));
    }

    static debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
}

// Initialize everything when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize theme manager
    window.themeManager = new ThemeManager();
    
    // Initialize dashboard animations
    window.dashboardAnimations = new DashboardAnimations();
    
    // Initialize notification manager
    window.notificationManager = new NotificationManager();
    
    // Add CSS animations
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideInRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        @keyframes slideOutRight {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(100%);
                opacity: 0;
            }
        }
        
        .small-box {
            transition: all 0.3s ease !important;
        }
    `;
    document.head.appendChild(style);
    
    // Show welcome notification
    setTimeout(() => {
        const userName = document.querySelector('.navbar-nav .nav-link span')?.textContent;
        if (userName) {
            window.notificationManager.show(
                `Добро пожаловать, ${userName}!`, 
                'success', 
                3000
            );
        }
    }, 1000);
});

// Export for global access
window.Utils = Utils;