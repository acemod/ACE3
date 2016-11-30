#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// restore gunbag info after respawn
["CAManBase", "respawn", {
    [{
        params ["_unit", "_corpse"];

        private _newBackpack = backpackContainer _unit;
        private _oldBackpack = backpackContainer _corpse;

        if !(typeOf _newBackpack isEqualTo typeOf _oldBackpack) exitWith {};

        private _state = _oldBackpack getVariable [QGVAR(gunbagWeapon), []];

        if !(_state isEqualTo []) then {
            _newBackpack setVariable [QGVAR(gunbagWeapon), _state, true];
        };
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
