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

params ["_vehicle", "_turret", "_carryMag", "_magSource", "_unit", "_ammo"];
TRACE_6("loadMagazine",_vehicle,_turret,_carryMag,_magSource,_unit,_ammo);

private _timeToLoad = GET_NUMBER(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime", 1);

private _displayName = format [localize LSTRING(loadX), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")];

private _onFinish = {
    (_this select 0) params ["_vehicle", "_turret", "_carryMag", "_magSource", "_unit", "_ammo"];
    TRACE_6("load progressBar finish",_vehicle,_turret,_carryMag,_magSource,_unit,_ammo);

    ([_vehicle, _turret, _carryMag] call FUNC(reload_canLoadMagazine)) params ["", "", "_neededAmmo", ""];
    if (_neededAmmo <= 0) exitWith { ERROR_1("Can't load ammo - %1",_this); };

    [_magSource, _carryMag, _ammo] call EFUNC(common,removeSpecificMagazine);

    private _nearUnits = _vehicle nearEntities ["CAManBase", 5];
    [QGVAR(clearNearbySourcesCache), [], _nearUnits] call CBA_fnc_targetEvent;

    private _returnTo = _magSource;

    // if we're pulling from a weaponHolder, return the ammo to the unit doing the action
    // workaround for weaponHolders being recreated with removeSpecificMagazine, magazines will still get dropped if inventory is full
    // TODO: remove after 2.14
    if (_magSource isKindOf "WeaponHolder") then {
        _returnTo = _unit;
    };

    TRACE_6("calling addTurretMag event",_vehicle,_turret,_magSource,_carryMag,_ammo, _unit);
    [QGVAR(addTurretMag), [_vehicle, _turret, _magSource, _carryMag, _ammo, _unit, _returnTo]] call CBA_fnc_globalEvent;
};

[
    TIME_PROGRESSBAR(_timeToLoad),
    [_vehicle, _turret, _carryMag, _magSource, _unit, _ammo],
    _onFinish,
    {TRACE_1("load progressBar fail",_this);},
    _displayName,
    {((_this select 0) call FUNC(reload_canLoadMagazine)) select 0},
    ["isNotInside"]
] call EFUNC(common,progressBar);
