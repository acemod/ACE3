#include "..\script_component.hpp"
/*
 * Author: Commy2, based on KK_fnc_playerWeaponMulfunction from KillzoneKid
 * Jam the weapon
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING> (default: primaryWeapon _unit)
 * 2: Jam Type <STRING> (default: ""), must be an allowed jam type for the weapon, if default or invalid selects randomly from allowed types
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, primaryWeapon player, "Feed"] call ace_overheating_fnc_jamWeapon
 *
 * Public: No
 */

params ["_unit", "", ["_jamType", "", [""]]];
TRACE_2("params",_unit,_jamType);

private _weapon = param [1, primaryWeapon _unit, [""]];

// don't jam a weapon with no rounds left
private _ammo = _unit ammo _weapon;
if (_ammo < 1) exitWith {};

private _jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];
_jammedWeapons pushBack _weapon;

_unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];

// Get jam types, select one from available types
// Cookoffs only happen on Fire and Dud, dud rounds are lost on jam clear.
// Reduce chance of duds as temp increases (functionally increasing the chance of the others but with fewer commands)
private _temp = 1 max (_unit getVariable [format [QGVAR(%1_temp), _weapon], 0]);
private _jamTypesAllowed = getArray (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(jamTypesAllowed));

if (_jamTypesAllowed isEqualTo []) then {
    _jamTypesAllowed = ["eject", 1, "extract", 1, "feed", 1, "fire", 1, "dud", (5 / (_temp / 5))];
} else {
    for "_i" from count _jamTypesAllowed -2 to 0 step -2 do {
        private _jamCurretType = toLowerANSI (_jamTypesAllowed select _i);
        if !(_jamCurretType in ["eject", "extract", "feed", "fire", "dud"]) exitWith { // check config values and switch to default values if unusual value found
            ERROR_3("Weapon '%1' has unexpected value %2 in '%3'. Expected values are 'Eject', 'Extract', 'Feed', 'Fire', 'Dud'.",_weapon,_jamCurretType,QGVAR(jamTypesAllowed));
            _jamTypesAllowed = ["eject", 1, "extract", 1, "feed", 1, "fire", 1, "dud", (5 / (_temp / 5))];
        };
        if (_jamCurretType == "dud") then {
            _jamTypesAllowed insert [_i, [5 / (_temp / 5)]];
        } else {
            _jamTypesAllowed insert [_i, [1]];
        };
    };
};

// if _jamType was given as a param when the function called check validity and select randomly if not valid.
_jamType = toLowerANSI _jamType;
if !(_jamType in _jamTypesAllowed) then {
    if (_jamType != "") then {
        ERROR_2("Weapon '%1' has attempted to jam with unexpected value %2. Expected values are 'Eject', 'Extract', 'Feed', 'Fire', 'Dud'.",_weapon,_jamType);
    };
    _jamType = selectRandomWeighted _jamTypesAllowed;
};

_unit setVariable [format [QGVAR(%1_jamType), _weapon], _jamType];

// Stop current burst
_unit setAmmo [_weapon, 0];
// this is to re-activate the 'DefaultAction', so you can jam a weapon while full auto shooting
[{
    params ["_unit", "_weapon", "_ammo"];
    _unit setAmmo [_weapon, _ammo];
}, [_unit, _weapon, _ammo]] call CBA_fnc_execNextFrame;

if (_weapon == primaryWeapon _unit) then {
    playSound QGVAR(jamming_rifle);
} else {
    if (_weapon == handgunWeapon _unit) then {
        playSound QGVAR(jamming_pistol);
    };
};

// only display the hint once, after you try to shoot an already jammed weapon
GVAR(knowAboutJam) = false;

["ace_weaponJammed", [_unit, _weapon, _jamType]] call CBA_fnc_localEvent;

if (_unit getVariable [QGVAR(JammingActionID), -1] == -1) then {

    private _condition = {
        private _unit = _this select 1;
        (weaponState _unit) params ["_currentWeapon", "_currentMuzzle"];

        _unit call CBA_fnc_canUseWeapon
        && {_currentMuzzle in (_unit getVariable [QGVAR(jammedWeapons), []])}
        && {!(["ace_safemode"] call EFUNC(common,isModLoaded)) || {!([_unit, _currentWeapon, _currentMuzzle] call EFUNC(safemode,getWeaponSafety))}}
    };

    private _statement = {
        params ["", "_unit"];

        playSound3D ["a3\sounds_f\weapons\Other\dry9.wss", objNull, insideBuilding _unit >= 0.5, eyePos _unit, 1, 1, 15];

        if (!(missionNamespace getVariable [QGVAR(knowAboutJam), false]) && {GVAR(DisplayTextOnJam)} && {_unit ammo currentWeapon _unit > 0}) then {
            private _jamType = _unit getVariable [format [QGVAR(%1_jamType), currentWeapon _unit], "None"];
            private _jamMessage = switch (_jamType) do {
                case "eject": {LLSTRING(FailureToEject)};
                case "extract": {LLSTRING(FailureToExtract)};
                case "feed": {LLSTRING(FailureToFeed)};
                default {LLSTRING(FailureToFire)};
            };
            [
                [LLSTRING(WeaponJammed)],
                [_jamMessage]
            ] call CBA_fnc_notify;
            GVAR(knowAboutJam) = true;
        };
    };

    private _id = [_unit, "DefaultAction", _condition, _statement] call EFUNC(common,addActionEventHandler);

    _unit setVariable [QGVAR(JammingActionID), _id];
};
