/* ==========================================================================
   D3XL FiveM Standalone Notification System V1 - Configuration
   ========================================================================== */

const Config = {
    position: "top-right", // "top-right" | "top-left" | "bottom-right" | "bottom-left"
    defaultDuration: 5000, // milliseconds (5s)
    soundEnabled: true,

    // Preset Notification Types
    types: {
        success: {
            title: "BAŞARILI",
            icon: "fa-circle-check",
            color: "#36FF9F" // tgiann Neon Mint
        },
        info: {
            title: "BİLGİLENDİRME",
            icon: "fa-circle-info",
            color: "#00f0ff" // Cyan
        },
        warning: {
            title: "UYARI",
            icon: "fa-triangle-exclamation",
            color: "#ffaa00" // Amber
        },
        error: {
            title: "HATA",
            icon: "fa-circle-xmark",
            color: "#ff0055" // Pink/Red
        },
        event: {
            title: "ETKİNLİK",
            icon: "fa-trophy",
            color: "#36FF9F"
        },
        announcement: {
            title: "DUYURU",
            icon: "fa-bullhorn",
            color: "#00f0ff"
        }
    }
};
