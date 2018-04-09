/*
 * Author: Grey
 * Loads Magazine into static weapon
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 * 2: magazine class to load; if not given the first compatible magazine is loaded <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target,_player,"ACE_1Rnd_82mm_Mo_HE"] call ace_mk6mortar_fnc_loadMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_static","_unit",["_magazineClassOptional","",[""]]];

//If function has been called with an optional classname hten add that magazine to the static weapon. Otherwise add the compatible magazine
if(_magazineClassOptional != "") then {
    _unit removeMagazine _magazineClassOptional;
    [QGVAR(addMagazine), [_static, _magazineClassOptional]] call CBA_fnc_globalEvent;
} else {
    //Get weapon & magazine information of static weapon
    private _weapon = (_static weaponsTurret [0]) select 0;
    private _currentMagazine = (magazinesAllTurrets _static) select 1;
    private _currentMagazineClass = _currentMagazine select 0;
    private _count = _currentMagazine select 2;

    //Check all of the players magazines to see if they are compatible with the static weapon. First magazine that is compatible is chosen
    //VKing: This section ought to be double checked.
    private _magazines = magazines _unit;
    private _magazineDetails = magazinesDetail _unit;
    private _listOfMagNames = getArray(configFile >> "cfgWeapons" >> _weapon >> "magazines");
    private _magazineClass = "";
    private _magazineClassDetails = "";
    private _roundsLeft = 0;
    {
        if (_x in _listOfMagNames) exitWith {
            _magazineClass = _x;
            _magazineClassDetails = _magazineDetails select _forEachIndex;
        };
    } forEach _magazines;
    //If the static weapon already has an empty magazine then remove it
    if (_count == 0) then {
        [QGVAR(removeMagazine), [_static, _currentMagazineClass]] call CBA_fnc_globalEvent;
    };
    //Find out the ammo count of the compatible magazine found
    if (_magazineClassDetails != "") then{
        private _parsed = _magazineClassDetails splitString "([]/: )";
        _parsed params ["_type", "", "", "_roundsLeftText", "_maxRoundsText"];
        _roundsLeft = parseNumber _roundsLeftText;
        _magType = _type;
    };

    _unit removeMagazine _magazineClass;
    [QGVAR(addMagazine), [_static, _magazineClass]] call CBA_fnc_globalEvent;
    [QGVAR(setAmmo), [_static, _magazineClass,_roundsLeft], _static] call CBA_fnc_targetEvent;
};
