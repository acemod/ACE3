#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Register default HUD for most missiles.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_missile_hud_fnc_registerDefaultHud
 *
 * Public: No
 */

[{
    params ["_unit", "_vehicle", "_weapon"];
    private _turretPath = _vehicle unitTurret _unit;
    private _pylons = (getAllPylonsInfo _vehicle) select { (_x select 2) isEqualTo _turretPath };
    private _hasAttackMode = false;
    scopeName "cond";
    {
        _x params ["", "", "", "_magazine"];
        private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo >> "ace_missileguidance";
        private _attackProfiles = getArray (_ammoConfig >> "attackProfiles");
        private _seeker = getText (_ammoConfig >> "defaultSeekerType");
        private _hudFnc = getText (configFile >> QEGVAR(missileguidance,SeekerTypes) >> _seeker >> "hudInfo");
        if (_hudFnc != "") exitWith { _hasAttackMode = true; };

        {
            private _config = configFile >> QEGVAR(missileguidance,AttackProfiles) >> _x;
            if (getText (_config >> "name") != "" || getText (_config >> "nameLocked") != "" || _hudFnc != "") exitWith {
                _hasAttackMode = true;
                breakTo "cond";
            }
        } forEach _attackProfiles;
    } forEach _pylons;
    _hasAttackMode
}, {
    params ["_unit", "_vehicle", "_weapon"];
    private _magazineDetails = createHashMap;

    private _turretPath = _vehicle unitTurret _unit;
    private _pylons = (getAllPylonsInfo _vehicle) select { (_x select 2) isEqualTo _turretPath };
    {
        _x params ["", "", "", "_magazine"];
        private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo >> "ace_missileguidance";
        private _defaultAttackProfile = getText (_ammoConfig >> "defaultAttackProfile");
        private _attackProfiles = getArray (_ammoConfig >> "attackProfiles");
        private _seeker = getText (_ammoConfig >> "defaultSeekerType");
        private _hudFnc = getText (configFile >> QEGVAR(missileguidance,SeekerTypes) >> _seeker >> "hudInfo");
        private _modes = createHashMap;
        {
            private _config = configFile >> QEGVAR(missileguidance,AttackProfiles) >> _x;
            _modes set [_x, [getText (_config >> "name"), getText (_config >> "nameLocked")]];
        } forEach _attackProfiles;

        _magazineDetails set [_magazine, [_modes, _defaultAttackProfile, _hudFnc, _ammoConfig]];
    } forEach _pylons;

    [_magazineDetails]
}, {
    params ["_unit", "_vehicle", "_weapon", "_params"];
    _params params ["_magazineDetails"];
    private _turretPath = _vehicle unitTurret _unit;
    private _magazine = _vehicle currentMagazineTurret _turretPath;
    if !(_magazine in _magazineDetails) exitWith { [] };
    (_magazineDetails get _magazine) params ["_modes", "_defaultAttackProfile", "_hudFnc", "_ammoConfig"];

    private _mode = _vehicle getVariable [QEGVAR(missileguidance,attackProfile), _defaultAttackProfile];
    (_modes getOrDefault [_mode, ["", ""]]) params ["_idleDisplay", "_lockedDisplay"];
    if (_idleDisplay == "" && _hudFnc == "") exitWith { [] };

    private _hud = [];
    if (_hudFnc != "") then {
        _hud = [_idleDisplay, _lockedDisplay, _unit, _vehicle, _ammoConfig] call (missionNamespace getVariable [_hudFnc, { [] }]);
    } else {
        _hud = ["TEXT", _idleDisplay, [1, 1, 1]];
    };
    _hud
}] call FUNC(registerElement);
