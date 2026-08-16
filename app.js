/* ==========================================================================
   D3XL SCRIPTS - Notification Engine V1 JavaScript
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {

    const notifyContainer = document.getElementById('notifyContainer');

    // Apply Position Class from Config
    if (notifyContainer && typeof Config !== 'undefined' && Config.position) {
        notifyContainer.className = `notify-container ${Config.position}`;
    }

    // Web Audio API Pop Sound Synthesizer (Strict Sound Toggle Check)
    function playSound(type, soundParam) {
        if (soundParam === false) return;
        if (typeof Config !== 'undefined') {
            if (Config.soundEnabled === false || Config.EnableSound === false) return;
        }

        try {
            const Ctx = window.AudioContext || window.webkitAudioContext;
            if (!Ctx) return;
            const ctx = new Ctx();
            const osc = ctx.createOscillator();
            const gain = ctx.createGain();

            osc.type = 'sine';
            const freq = type === 'error' ? 300 : type === 'warning' ? 600 : 900;
            osc.frequency.setValueAtTime(freq, ctx.currentTime);
            osc.frequency.exponentialRampToValueAtTime(1200, ctx.currentTime + 0.05);

            gain.gain.setValueAtTime(0.06, ctx.currentTime);
            gain.gain.exponentialRampToValueAtTime(0.001, ctx.currentTime + 0.05);

            osc.connect(gain);
            gain.connect(ctx.destination);
            osc.start();
            osc.stop(ctx.currentTime + 0.05);
        } catch (e) {}
    }

    // Create Notification Toast Card
    function createNotification(data) {
        if (!notifyContainer) return;

        // Position update if passed from client
        if (data.position && notifyContainer.className !== `notify-container ${data.position}`) {
            notifyContainer.className = `notify-container ${data.position}`;
        }

        const typeKey = (data.type || 'info').toLowerCase();
        const typeConfig = (typeof Config !== 'undefined' && Config.types && Config.types[typeKey])
            ? Config.types[typeKey]
            : { title: 'BİLGİ', icon: 'fa-circle-info', color: '#00f0ff' };

        const title = data.title || typeConfig.title;
        const message = data.message || data.text || '';
        const subtext = data.subtext || '';
        const color = data.color || typeConfig.color;
        const icon = data.icon || typeConfig.icon;
        const duration = parseInt(data.duration || (Config.defaultDuration || 5000));

        // Create Card Element
        const card = document.createElement('div');
        card.className = 'notify-card';

        card.innerHTML = `
            <div class="card-header">
                <span class="card-title" style="color: ${color};">${title}</span>
                <i class="fa-solid ${icon} card-icon" style="color: ${color};"></i>
            </div>
            <div class="card-msg">${message}</div>
            ${subtext ? `<div class="card-subtext" style="color: ${color};">${subtext}</div>` : ''}
            <div class="card-progress-bg">
                <div class="card-progress-fill" style="background: ${color}; box-shadow: 0 0 10px ${color};"></div>
            </div>
        `;

        notifyContainer.appendChild(card);
        playSound(typeKey, data.sound);

        const progressFill = card.querySelector('.card-progress-fill');
        if (progressFill) {
            progressFill.style.transition = `width ${duration}ms linear`;
            setTimeout(() => {
                progressFill.style.width = '0%';
            }, 20);
        }

        // Auto Remove Timeout
        setTimeout(() => {
            card.classList.add('closing');
            setTimeout(() => {
                card.remove();
            }, 300);
        }, duration);
    }

    // FiveM NUI & Window Message Listener
    window.addEventListener('message', (e) => {
        const item = e.data || {};
        if (item.action === 'notify' || item.type === 'notify' || item.title || item.message) {
            createNotification(item);
        }
    });

    // Global helper
    window.createNotification = createNotification;
});

