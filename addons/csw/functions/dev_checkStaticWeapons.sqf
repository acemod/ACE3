// Dev only function to search for weapons used by static weapons
// and check if their magazinese are compatible

#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("Checking static weapons");


{
    private _explicitlyEnabled = _enabled && {(count configProperties [_x, "configName _x == 'ace_csw'", false]) == 1};
    if (!_explicitlyEnabled) then {
        diag_log text format ["%1 - %2", _x, count _explicitlyEnabled];
    };
} forEach ("1 == getNumber (_x >> 'ace_csw' >> 'enabled')" configClasses (configFile >> "CfgVehicles"));


private _staticWeaponConfigs = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(configName _x) isKindOf 'StaticWeapon'}",true];

private _hash = [] call CBA_fnc_hashCreate;

{
    private _vehicleType = configName _x;
    private _turretConfig = [_vehicleType, [0]] call CBA_fnc_getTurret;
    private _weapons = getArray (_turretConfig >> "weapons");
    private _magazines = getArray (_turretConfig >> "magazines");
    {
        private _weapMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
        {
            private _xMag = _x;
            private _groups = "getNumber (_x >> _xMag) == 1" configClasses (configFile >> QGVAR(groups));
            private _carryMag = configName (_groups param [0, configNull]);
            if (_carryMag == "") then {
                private _vehs = [_hash, _xMag] call CBA_fnc_hashGet;
                if (isNil "_vehs") then {_vehs = [];};
                if (_xMag in _magazines) then {
                    _vehs pushBack _vehicleType;
                };
                [_hash, _xMag, _vehs] call CBA_fnc_hashSet;
            };
        } forEach _weapMags;
    } forEach _weapons;
} forEach _staticWeaponConfigs;

[_hash, {
    INFO_2("[%1] has no carry varient - Used in %2",_key,_value);
}] call CBA_fnc_hashEachPair;
