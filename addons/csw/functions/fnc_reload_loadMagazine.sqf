#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Loads a magazine into a CSW from a magazine carried by or next to the player.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Turret <ARRAY>
 * 2: Unit Carried Magazine <STRING>
 * 3: Magazine source <OBJECT>
 * 4: Unit doing the action <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], "ACE_csw_100Rnd_127x99_mag_red", player, player] call ace_csw_fnc_reload_loadMagazine
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_carryMag", "_magSource", "_unit"];
TRACE_5("loadMagazine",_vehicle,_turret,_carryMag,_magSource,_unit);

private _timeToLoad = 1;
private _config = configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime";
if (!isNull _config) then {
    _timeToLoad = getNumber _config;
};

private _displayName = format [LLSTRING(loadX), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")];

private _onFinish = {
    (_this select 0) params ["_vehicle", "_turret", "_carryMag", "_magSource", "_unit"];
    TRACE_5("load progressBar finish",_vehicle,_turret,_carryMag,_magSource,_unit);

    ([_vehicle, _turret, _carryMag, _magSource] call FUNC(reload_canLoadMagazine)) params ["", "", "_neededAmmo", ""];
    if (_neededAmmo <= 0) exitWith { ERROR_1("Can't load ammo - %1",_this); };

    // Figure out what we can add from the magazines we have
    private _bestAmmoToSend = -1;
    {
        _x params ["_xMag", "_xAmmo"];
        if (_xMag == _carryMag) then {
            if ((_bestAmmoToSend == -1) || {(_xAmmo > _bestAmmoToSend) && {_xAmmo <= _neededAmmo}}) then {
                _bestAmmoToSend = _xAmmo;
            };
        };
    } forEach (if (_magSource isKindOf "CAManBase") then {magazinesAmmo _magSource} else {magazinesAmmoCargo _magSource});

    if (_bestAmmoToSend == -1) exitWith {ERROR_2("No ammo [%1 - %2]?",_carryMag,_bestAmmoToSend);};
    [_magSource, _carryMag, _bestAmmoToSend] call EFUNC(common,removeSpecificMagazine);
    if (_bestAmmoToSend == 0) exitWith {};

    // Workaround for removeSpecificMagazine and WeaponHolders being deleted when empty, give back to the unit if the weapon holder was deleted
    // TODO: Pass type and position of deleted object to create a new one
    private _args = [_vehicle, _turret, _magSource, _carryMag, _bestAmmoToSend];

    // If the source is set for deletion, give mag back to unit
    if (_magSource getEntityInfo 14) then {
        _args pushBack _unit;
    };

    TRACE_1("calling addTurretMag event",_args);
    [QGVAR(addTurretMag), _args] call CBA_fnc_globalEvent;
    _vehicle setVariable [QGVAR(reloader), _unit, true];
};


[
    TIME_PROGRESSBAR(_timeToLoad),
    [_vehicle, _turret, _carryMag, _magSource],
    _onFinish,
    {TRACE_1("load progressBar fail",_this);},
    _displayName,
    {((_this select 0) call FUNC(reload_canLoadMagazine)) select 0},
    ["isNotInside"]
] call EFUNC(common,progressBar);
