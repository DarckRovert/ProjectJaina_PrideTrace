# 🌐 Registro de Ecosistema — WoWPeru_PrideTrace

Ficha técnica oficial de registro en la infraestructura multi-addon de **WoW Perú - Reino Andino**.

---

## 1. Identidad del Addon

| Campo | Valor |
|---|---|
| **Nombre Técnico** | `WoWPeru_PrideTrace` |
| **Título en Cliente** | `WoW Peru - Pride diagnostic` |
| **Versión** | `1.0.0` |
| **Tipo de Sistema** | Telemetría y Diagnóstico de Input de Vuelo (Solo Lectura / QA) |
| **Repositorio GitHub** | [DarckRovert/WoWPeru_PrideTrace](https://github.com/DarckRovert/WoWPeru_PrideTrace) |
| **Directorio de Instalación** | `Interface\AddOns\WowPeruPrideTrace\` |

---

## 2. Red y Mensajería de Addon

| Propiedad | Valor |
|---|---|
| **Prefijo Oficial** | Ninguno (Operación local pasiva de captura de eventos de hardware) |
| **Canales de Red** | N/A |
| **OpCodes Manejados** | N/A |
| **Filtro de Personaje** | Gated internamente al personaje de QA `"Snak"` (`UnitName("player") == "Snak"`) |

---

## 3. Persistencia de Datos

| Variable Global | Tipo | Ámbito | Propósito |
|---|---|---|---|
| `WG_PRIDE_TRACE` | Tabla Lua (`SavedVariables`) | Por Cuenta | Registro cronológico de inputs de control en secuencias de vuelo scripted. |

---

## 4. Matriz de Integración del Ecosistema

| Sistema Coexistente | Modo de Interacción | Flujo de Datos |
|---|---|---|
| **Motor de Juego AzerothCore** | Escucha Pasiva | Monitorea eventos de input durante mecánicas de vehículos y monturas de transporte. |

---

## 5. Garantías de Rendimiento

- **Tiempo de Cuadro:** < 0.01 ms por frame.
- **Memoria en Tiempo de Ejecución:** < 45 KB de memoria Lua.
- **Compatibilidad de Hardware:** 100% verificado.
