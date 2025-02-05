#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Text statement for the pointer slot capabilites.
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
    private _laser = (getText (_xCfg >> "Pointer" >> "irLaserPos")) != "";
    private _illum = (getNumber (_xCfg >> "Flashlight" >> "intensity")) > 0;
    private _isIR = (_laser && {([_xCfg >> "Pointer" >> "isIR", "NUMBER", 1] call CBA_fnc_getConfigEntry) == 1})
                  || {_illum && {([_xCfg >> "Flashlight" >> "irLight", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1}};

    private _text = switch (true) do { // shorthand roughly based on PEQ-15
        case (_laser && _illum): { ["VIS-DUAL", "IR-DUAL"] select _isIR }; // DUAL
        case (_laser): { ["VIS-AIM", "IR-AIM"] select _isIR }; // AIM
        case (_illum): { ["VIS-ILM", "IR-ILM"] select _isIR }; // ILLUMIATION
        default { "_" }; // there are some purely cosmetic attachements
    };
    _allModes pushBackUnique _text;
} forEach _allItems;

_allModes joinString ", "
