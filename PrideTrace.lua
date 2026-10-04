-- Temporary diagnosis only: observe input and replies, never cast or change actions.
local frame = CreateFrame("Frame")
local active = false
local weapons = { [73456] = true, [73477] = true }

local function Pack(...)
    local result = {}
    for i = 1, select("#", ...) do
        local value = select(i, ...)
        result[i] = tostring(value)
    end
    return result
end

local function Record(event, ...)
    if not active or #WG_PRIDE_TRACE.events >= 500 then return end
    table.insert(WG_PRIDE_TRACE.events, { time = GetTime(), event = event, args = Pack(...) })
end

local function Snapshot(reason)
    if not active then return end
    Record("SNAPSHOT", reason, UnitGUID("player"), UnitGUID("vehicle"), UnitGUID("pet"),
        UnitGUID("target"), UnitHasVehicleUI("player"), UnitInVehicleControlSeat("player"),
        SpellIsTargeting(), IsVehicleAimAngleAdjustable(), GetBonusBarOffset())
    for i = 1, 6 do
        local button = _G["VehicleMenuBarActionButton" .. i]
        if button then
            Record("BUTTON", i, button.action, button:GetAttribute("type"),
                button:GetAttribute("action"), button:GetAttribute("actionpage"),
                button:GetButtonState(), button:GetChecked())
            if button.action then
                Record("ACTION", i, GetActionInfo(button.action))
                Record("USABLE", i, IsUsableAction(button.action))
                Record("COOLDOWN", i, GetActionCooldown(button.action))
            end
        end
    end
    for spell in pairs(weapons) do
        Record("SPELL", spell, GetSpellInfo(spell))
    end
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
frame:RegisterEvent("UNIT_EXITED_VEHICLE")
frame:RegisterEvent("UNIT_SPELLCAST_SENT")
frame:RegisterEvent("UNIT_SPELLCAST_START")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:RegisterEvent("UNIT_SPELLCAST_FAILED")
frame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
frame:RegisterEvent("UI_ERROR_MESSAGE")
frame:RegisterEvent("ADDON_ACTION_BLOCKED")
frame:RegisterEvent("ADDON_ACTION_FORBIDDEN")
frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        active = UnitName("player") == "Snak"
        if not active then return end
        WG_PRIDE_TRACE = { version = 1, started = date("%Y-%m-%d %H:%M:%S"), events = {} }
        hooksecurefunc("UseAction", function(action, ...)
            if UnitHasVehicleUI("player") then
                Record("USE_ACTION", action, ...)
                Snapshot("UseAction")
            end
        end)
        hooksecurefunc("CastPetAction", function(...) Record("CAST_PET_ACTION", ...) end)
        for i = 1, 6 do
            local button = _G["VehicleMenuBarActionButton" .. i]
            if button then
                button:HookScript("PostClick", function(self, ...)
                    Record("CLICK", self:GetID(), ...)
                    Snapshot("PostClick")
                end)
            end
        end
        DEFAULT_CHAT_FRAME:AddMessage("Registro temporal del avión activo; no modifica habilidades.")
        Snapshot(event)
    elseif active then
        Record(event, ...)
        if event == "UNIT_ENTERED_VEHICLE" or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LOGOUT" then
            Snapshot(event)
        end
    end
end)
