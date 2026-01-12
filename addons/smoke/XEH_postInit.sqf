#include "script_component.hpp"

GVAR(ppHandleDynamicBlur) = ppEffectCreate ["DynamicBlur", 500];
GVAR(ppHandleColorCorrections) = ppEffectCreate ["ColorCorrections", 1500];
GVAR(ppHandleDynamicBlur) ppEffectEnable GVAR(enabled);
GVAR(ppHandleColorCorrections) ppEffectEnable GVAR(enabled);

if (GVAR(enabled)) then {
    GVAR(pfh) = [{
        [ace_player] call FUNC(pfh);
    }] call CBA_fnc_addPerFrameHandler;
};

["loadout", {
    params ["_unit"];
    if !(local _unit) exitWith {};
    private _config = configFile >> "CfgGlasses" >> goggles _unit;
    private _breathing = getNumber (_config >> QGVAR(Breathing_Protection));
    _unit setVariable [QGVAR(breathingProtection), _breathing, true];
    private _eyes = getNumber (_config >> QGVAR(Eyes_Protection));
    _unit setVariable [QGVAR(eyesProtection), _eyes, true];
}, true] call CBA_fnc_addPlayerEventHandler;
