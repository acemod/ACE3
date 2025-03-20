#include "..\script_component.hpp"
/*
 * Author: esteldunedain / Cyruz / diwako
 * Produces a casing matching the fired weapons caliber on the ground around the unit
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: ammo - Ammo used <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "","", "B_556x45_Ball"] call ace_casings_fnc_createCasing
 *
 * Public: No
 */

params ["_unit", "", "", "", "_ammo"];

if (!isNull objectParent _unit) exitWith {};


private _modelPath = GVAR(cachedCasings) getOrDefaultCall [_ammo, {
    private _cartridgeConfig = configNull; // private var in switch condition scope isn't available in the result block.
    private _modelOverride = ""; // very annoying.

    private _cartridge = getText (configFile >> "CfgAmmo" >> _ammo >> "cartridge");
    private _model = switch (true) do {
        case (_cartridge == ""): { "" };

        _cartridgeConfig = configFile >> "CfgVehicles" >> _cartridge;
        _modelOverride = getText (_cartridgeConfig >> QGVAR(model));

        case (_modelOverride != ""): { _modelOverride }; // Use the override if non-empty
        default { getText (_cartridgeConfig >> "model") } // Use the casing's default model
    };

    // Add file extension if missing (fileExists needs file extension)
    if ((_model select [count _model - 4]) != ".p3d") then {
        _model = _model + ".p3d";
    };

    ["", _model] select (!("a3\weapons_f\empty" in toLowerANSI _model) && {fileExists _model})
}, true];

[_unit, _modelPath] call FUNC(createLitter);
