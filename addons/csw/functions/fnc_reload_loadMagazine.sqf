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
 * 5: Ammo <NUMBER>
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

private _timeToLoad = GET_NUMBER(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime",1);

private _displayName = format [LLSTRING(loadX), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")];

private _onFinish = {
    (_this select 0) params ["_vehicle", "_turret", "_carryMag", "_magSource", "_unit", "_ammo"];
    TRACE_6("load progressBar finish",_vehicle,_turret,_carryMag,_magSource,_unit,_ammo);

    ([_vehicle, _turret, _carryMag] call FUNC(reload_canLoadMagazine)) params ["", "", "_neededAmmo", ""];
    if (_neededAmmo <= 0) exitWith { ERROR_1("Can't load ammo - %1",_this); };

    [_magSource, _carryMag, _ammo] call EFUNC(common,removeSpecificMagazine);

    private _nearUnits = _vehicle nearEntities ["CAManBase", DISTANCE_SEARCH_RADIUS];
    [QGVAR(clearNearbySourcesCache), [], _nearUnits] call CBA_fnc_targetEvent;

    // Workaround for removeSpecificMagazine and WeaponHolders being deleted when empty, give back to the unit if the weapon holder was deleted
    // TODO: Pass type and position of deleted object to create a new one
    // TODO: Use '_magSource getEntityInfo 14' in 2.18 and the isSetForDeletion flag to execute in same frame
    [{
        params ["_magSource", "_unit", "_args"];

        if (isNull _magSource) then {
            _args pushBack _unit;
        };

        TRACE_1("calling addTurretMag event",_args);
        [QGVAR(addTurretMag), _args, _args select 0, _args select 1] call CBA_fnc_turretEvent;
    }, [_magSource, _unit, [_vehicle, _turret, _magSource, _carryMag, _ammo]]] call CBA_fnc_execNextFrame;
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
