#include "..\script_component.hpp"
/*
 * Author: GabrielPearce / esteldunedain / Cyruz / diwako / PabstMirror
 * Produces a casing matching the reloaded and dropped magazine
 *
 * Arguments:
 * 0: unit - Object the reloaded event handler is assigned to <OBJECT>
 * 4: Old magazine (can be nil) - <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "","", ["1Rnd_HE_Grenade_shell", 0]] call ace_casings_fnc_createMagazine
 *
 * Public: No
 */

params ["_unit", "", "", "", "_oldMagazine"];
TRACE_2("createMagazine",_unit,_oldMagazine);

if (isNil "_oldMagazine") exitWith {};
_oldMagazine params ["_mag", "_ammo"];
if (_ammo != 0) exitWith {};

private _modelPath = GVAR(cachedMagazines) getOrDefaultCall [_mag, {
    private _magConfig = configNull; // private var in switch condition scope isn't available in the result block.
    private _modelOverride = ""; // very annoying.

    private _model = switch true do {
         // Should cover most 40x36
        case (_mag in compatibleMagazines ["arifle_Mk20_GL_F", "EGLM"]): { "A3\Weapons_F\MagazineProxies\mag_40x36_HE_1rnd.p3d" };

        _magConfig = configFile >> "CfgMagazines" >> _mag;
        _modelOverride = getText (_magConfig >> QGVAR(model));

        case (_modelOverride != ""): { _modelOverride }; // Use the override if non-empty
        case (getNumber (_magConfig >> "modelSpecialIsProxy") == 1): {getText (_magConfig >> "modelSpecial")}; // Use the magazine's proxy

        default { getText (_magConfig >> "model") }; // Use the magazine's dropped model
    };

    // Add file extension if missing (fileExists needs file extension)
    if ((_model select [count _model - 4]) != ".p3d") then {
        _model = _model + ".p3d";
    };

    ["", _model] select (!(_model regexMatch "(?:\\)?a3\\weapons_f\\(?:empty|ammo\\mag_univ).p3d") && {fileExists _model})
}, true];

[_unit, _modelPath, true] call FUNC(createLitter);
