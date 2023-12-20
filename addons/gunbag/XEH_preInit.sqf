#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// restore gunbag info after respawn
["CAManBase", "respawn", {
    [{
        params ["_unit", "_corpse"];

        private _newBackpack = backpackContainer _unit;
        private _oldBackpack = backpackContainer _corpse;

        if (typeOf _newBackpack isNotEqualTo typeOf _oldBackpack) exitWith {};

        private _state = _oldBackpack getVariable [QGVAR(gunbagWeapon), []];

        if (_state isNotEqualTo []) then {
            _newBackpack setVariable [QGVAR(gunbagWeapon), _state, true];
        };
    }, _this] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addClassEventHandler;

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    private _gunbagWeapon = _extendedInfo getOrDefault [QGVAR(gunbagWeapon), []];
    if (_gunbagWeapon isNotEqualTo []) then {
        if (!isNil QEGVAR(arsenal,virtualItemsFlatAll)) then {
            private _weapon = (_gunbagWeapon select 0) call EFUNC(arsenal,baseWeapon);
            if !(_weapon in EGVAR(arsenal,virtualItemsFlatAll)) then {
                INFO_1("removing [%1] from loadout",_gunbagWeapon);
                _gunbagWeapon = [];
            };
        };
        (backpackContainer _unit) setVariable [QGVAR(gunbagWeapon), _gunbagWeapon, true];
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    private _gunbagWeapon = (backpackContainer _unit) getVariable [QGVAR(gunbagWeapon), []];
    if (_gunbagWeapon isNotEqualTo []) then {
        _extendedInfo set [QGVAR(gunbagWeapon), _gunbagWeapon];
    };
}] call CBA_fnc_addEventHandler;

ADDON = true;
