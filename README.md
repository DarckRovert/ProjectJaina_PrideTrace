# WowPeruPrideTrace — Diagnóstico de Input en Vuelo

> **WoW Perú Ecosystem** · WotLK 3.3.5a compatible · `Interface: 30300`

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Herramienta de **diagnóstico de input en tiempo real** de sólo lectura para el sistema de vuelo (aircraft) del servidor WoW Perú. No modifica hechizos ni keybindings. Diseñado para identificar problemas de captura de input durante secuencias de vuelo scripted.

> ⚠️ **Filtro de Seguridad Interno** — El registro de eventos está restringido al personaje de QA y desarrollo `"Snak"`.

---

## Características

- **Solo lectura** — No altera ningún keybinding ni spell.
- **Diagnóstico en tiempo real** — Muestra en pantalla qué inputs se registran durante el vuelo.
- **Temporal** — Addon de soporte para el equipo de QA de WoW Perú.
- Compatible con WotLK 3.3.5a (Interface 30300) y Cataclysm 4.3.

## Instalación

1. Copia la carpeta `WowPeruPrideTrace` a `Interface/AddOns/`.
2. Activa el addon desde el selector de personaje (solo en cuentas de desarrollo/QA).

## Variables Guardadas

- `WG_PRIDE_TRACE` — Log de sesión de input.

## Créditos y Licencia

- **Autor:** DarckRovert (Elnazzareno) & WoW Perú Team
- **Versión:** 1.0.0
- **Licencia:** [MIT License](LICENSE)

---

## Documentación del Ecosistema

* [Ficha Técnica Oficial del Ecosistema](ECOSYSTEM_REGISTRY.md)
* [Historial de Cambios](CHANGELOG.md)

---

*Parte del [ecosistema WoW Perú](https://github.com/DarckRovert)*