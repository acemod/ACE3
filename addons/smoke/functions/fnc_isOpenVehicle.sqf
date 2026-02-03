#include "..\script_component.hpp"
/*
 * Author: BrettMayson
 * Check if a vehicle is open and thus susceptible to smoke entering
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Is the vehicle open? <BOOL>
 *
 * Example:
 * [vehicle player] call ace_smoke_fnc_isOpenVehicle
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]]
];

if (_vehicle isEqualTo objNull) exitWith { true };

private _class = typeOf _vehicle;

if (_class in GVAR(openVehicleCache)) exitWith { GVAR(openVehicleCache) get _class };

private _attenuation = getText(configFile >> "CfgVehicles" >> _class >> "attenuationEffectType");
if (_attenuation == "") exitWith { true };

private _attenuation = configFile >> "AttenuationEffects" >> _attenuation;
private _open = [0,1] findIf {
    private _equalizer = getArray(_attenuation >> format ["Equalizer%1", _x] >> "gain");
    _equalizer isEqualTo [1,1,1,1]
} != -1;

GVAR(openVehicleCache) set [_class, _open];
_open
