#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Loads a magazine into a static weapon from a magazine carried by or next to the player.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
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
if (!isNull(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime")) then {
    _timeToLoad = getNumber(configOf _vehicle >> QUOTE(ADDON) >> "ammoLoadTime");
};

private _displayName = format [localize LSTRING(loadX), getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName")];

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

    if (_bestAmmoToSend == -1) exitWith {ERROR_2("No ammo [%1 - %2]?",_xMag,_bestAmmoToSend);};
    [_magSource, _carryMag, _bestAmmoToSend] call EFUNC(common,removeSpecificMagazine);
    if (_bestAmmoToSend == 0) exitWith {};

    // workaround for removeSpecificMagazine and WeaponHolders being deleted when empty, get the closest object of same type on the next frame
    private _magSourcePos = getPosATL _magSource;
    private _magSourceType = typeOf _magSource;
    private _eventParams = [_vehicle, _turret, objNull, _carryMag, _bestAmmoToSend];
    [{
        params ["_args", "_magSourcePos", "_magSourceType"];
        _args params ["_vehicle", "_turret", "_magSource", "_carryMag", "_bestAmmoToSend"];
        _magSource = _magSourcePos nearestObject _magSourceType;

        TRACE_6("calling addTurretMag event",_vehicle,_turret,_magSource,_carryMag,_bestAmmoToSend, _unit);
        [QGVAR(addTurretMag), [_vehicle, _turret, _magSource, _carryMag, _bestAmmoToSend, _unit]] call CBA_fnc_globalEvent;

    }, [_eventParams, _magSourcePos, _magSourceType]] call CBA_fnc_execNextFrame;
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
