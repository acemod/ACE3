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

[QEGVAR(arsenal,loadoutVerified), {
    params ["_loadout", "_extendedInfo", "", "", "_missingExtendedInfo"];
    private _gunbagInfo = _extendedInfo getOrDefault [QGVAR(gunbagWeapon), []];
    if (_gunbagInfo isEqualTo []) exitWith {};

    private _weapon = (_gunbagInfo select 0) call EFUNC(arsenal,baseWeapon);
    if !(_weapon in EGVAR(arsenal,virtualItemsFlat)) exitWith {
        _missingExtendedInfo pushBack [QGVAR(gunbagWeapon), _weapon];
        _extendedInfo deleteAt QGVAR(gunbagWeapon);
    };
    private _missingItems = [];
    private _attachments = _gunbagInfo select 1;
    {
        if (_x != "" && {!(_x call EFUNC(arsenal,baseWeapon) in EGVAR(arsenal,virtualItemsFlat))}) then {
            _missingItems pushBack _x;
            _attachments set [_forEachIndex, ""];
        };
    } forEach _attachments;
    private _magazines = _gunbagInfo select 2;
    {
        private _class = _x param [0, ""];
        if (_class != "" && {!(_class in EGVAR(arsenal,virtualItemsFlat))}) then {
            _missingItems pushBack _class;
            _magazines set [_forEachIndex, ["", 0]];
        };
    } forEach _magazines;
    if (_missingItems isNotEqualTo []) then {
        _missingExtendedInfo pushBack [QGVAR(gunbagWeapon), _missingItems];
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    private _gunbagWeapon = _extendedInfo getOrDefault [QGVAR(gunbagWeapon), []];
    if (_gunbagWeapon isNotEqualTo []) then {
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
