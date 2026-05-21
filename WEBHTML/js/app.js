document.addEventListener('DOMContentLoaded', () => {
    
    // --- 1. Multi-language Logic ---
    const languageSelector = document.getElementById('language-selector');
    const elementsToTranslate = document.querySelectorAll('[data-i18n]');
    
    // Detect browser language (default to 'en' if not 'es')
    let userLang = navigator.language || navigator.userLanguage;
    let currentLang = userLang.startsWith('es') ? 'es' : 'en';

    // Set the initial value of the dropdown
    if (languageSelector) {
        languageSelector.value = currentLang;
    }

    // Function to apply translations
    function applyTranslations(lang) {
        if (!translations || !translations[lang]) return;
        
        elementsToTranslate.forEach(el => {
            const key = el.getAttribute('data-i18n');
            let text = translations[lang][key];
            if (text && translations[lang]['appName']) {
                text = text.replace('{appName}', translations[lang]['appName']);
            }
            if (text) {
                el.textContent = text;
            }
        });
    }

    // Apply translations on load
    applyTranslations(currentLang);

    // Change translations on dropdown change
    if (languageSelector) {
        languageSelector.addEventListener('change', (e) => {
            currentLang = e.target.value;
            applyTranslations(currentLang);
        });
    }

    // --- 2. Scroll Animations & Video Autoplay Logic ---
    const faders = document.querySelectorAll('.fade-in');
    const videos = document.querySelectorAll('.feature-video');

    const appearOptions = {
        threshold: 0.15,
        rootMargin: "0px 0px -50px 0px"
    };

    const appearOnScroll = new IntersectionObserver(function(entries, observer) {
        entries.forEach(entry => {
            if (!entry.isIntersecting) {
                return;
            } else {
                entry.target.classList.add('visible');
            }
        });
    }, appearOptions);

    faders.forEach(fader => {
        appearOnScroll.observe(fader);
    });

    const videoOptions = {
        threshold: 0.5 // Video must be 50% visible to play
    };

    const videoObserver = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            const video = entry.target;
            if (entry.isIntersecting) {
                let playPromise = video.play();
                if (playPromise !== undefined) {
                    playPromise.catch(error => {
                        console.log("Autoplay was prevented by the browser.");
                    });
                }
            } else {
                video.pause();
            }
        });
    }, videoOptions);

    videos.forEach(video => {
        videoObserver.observe(video);
    });
});
