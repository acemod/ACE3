#include "script_component.hpp"

if (!hasInterface) exitWith {};
GVAR(ppHandleDynamicBlur) = ppEffectCreate ["DynamicBlur", 500];
GVAR(ppHandleColorCorrections) = ppEffectCreate ["ColorCorrections", 1500];

["featureCamera", {
    params ["", "_newCamera"];
    private _showEffects = (_newCamera == "") && {GVAR(pfh) != -1};
    GVAR(ppHandleDynamicBlur) ppEffectEnable _showEffects;
    GVAR(ppHandleColorCorrections) ppEffectEnable _showEffects;
}] call CBA_fnc_addPlayerEventHandler;

["loadout", {
    params ["_unit"];
    if !(local _unit) exitWith {};
    private _config = configFile >> "CfgGlasses" >> goggles _unit;
    private _breathing = getNumber (_config >> QGVAR(Breathing_Protection));
    _unit setVariable [QGVAR(breathingProtection), _breathing, true];
    private _eyes = getNumber (_config >> QGVAR(Eyes_Protection));
    _unit setVariable [QGVAR(eyesProtection), _eyes, true];
}, true] call CBA_fnc_addPlayerEventHandler;
