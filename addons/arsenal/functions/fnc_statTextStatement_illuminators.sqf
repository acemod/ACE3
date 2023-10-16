#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Text statement for the illuminator//pointer slot.
 *
 * Arguments:
 * 0: Not used
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Example:
 * [[], configFile >> "CfgWeapons" >> "acc_pointer_IR"] call ace_arsenal_fnc_statTextStatement_illuminators
 *
 * Public: No
 */

params ["", "_config"];
TRACE_1("statTextStatement_illuminators",_config);

private _allModes = [];
private _allItems = [configName _config] call CBA_fnc_switchableAttachments;
if (_allItems isEqualTo []) then { _allItems = [configName _config] };

{
    private _xCfg = configFile >> "CfgWeapons" >> _x >> "ItemInfo";
    // DBAL can do both at same time, but lets just only list laser if it has it
    private _text = switch (true) do { 
        case (isClass (_xCfg >> "Pointer")): {
            if (([_xCfg >> "Pointer" >> "isIR", "NUMBER", 1] call CBA_fnc_getConfigEntry) == 1) then {
                "L-IR"
            } else {
                // private _color = vectorNormalized getArray (_xCfg >> "Pointer" >> "dotColor");
                "L-C"
            };
        };
        case ((getNumber (_xCfg >> "Flashlight" >> "intensity")) > 0): {
            if (([_xCfg >> "Flashlight" >> "irLight", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1) then {
                "F-IR"
            } else {
                "F-C"
            };
        };
        default {"?"};
    };
    _allModes pushBack _text;
} forEach _allItems;

_allModes joinString ","
