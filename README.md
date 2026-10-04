# WowPeruPrideTrace — Diagnóstico de Input en Vuelo

> **WoW Perú Ecosystem** · WotLK 3.3.5a compatible · `Interface: 30300`

Herramienta de **diagnóstico de input en tiempo real** de sólo lectura para el sistema de vuelo (aircraft) del servidor WoW Perú. No modifica hechizos ni keybindings. Diseñado para identificar problemas de captura de input durante secuencias de vuelo scripted.

---

## Características

- **Solo lectura** — No altera ningún keybinding ni spell.
- **Diagnóstico en tiempo real** — Muestra en pantalla qué inputs se registran durante el vuelo.
- **Temporal** — Addon de soporte para el equipo de QA de WoW Perú.
- Compatible con WotLK 3.3.5a y Cataclysm 4.3.

## Instalación

1. Copia la carpeta `WowPeruPrideTrace` a `Interface/AddOns/`.
2. Activa el addon desde el selector de personaje (solo en cuentas de desarrollo/QA).

## Variables Guardadas

- `WG_PRIDE_TRACE` — Log de sesión de input.

## Créditos

- **Autor:** DarckRovert (Elnazzareno) & WoW Perú Team
- **Licencia:** Uso interno WoW Perú

---

*Parte del [ecosistema WoW Perú](https://github.com/DarckRovert)*