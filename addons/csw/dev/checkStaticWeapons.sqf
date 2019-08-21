#define DEBUG_MODE_FULL
#include "\z\ace\addons\csw\script_component.hpp"

// Dev only function to search for weapons used by static weapons
// and check if their magazinese are compatible
INFO("Checking static weapons");

private _staticWeaponConfigs = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(configName _x) isKindOf 'StaticWeapon'}", true];
private _staticPublic = _staticWeaponConfigs select {(getNumber (_x >> "scope")) == 2};
INFO_2("Static Weapons [%1] - CSW Enabled [%2]",count _staticPublic, {(getNumber (_x >> "ace_csw" >> "enabled")) == 1} count _staticPublic);

INFO("------ Checking static weapons inheritance ------");
private _explicitBases = [];
private _inherited = [];
{
    private _config = _x;
    private _configEnabled = (getNumber (_config >> "ace_csw" >> "enabled")) == 1;
    if (_configEnabled) then {
        private _configExplicit = (count configProperties [_config, "configName _x == 'ace_csw'", false]) == 1;
        if (_configExplicit) then {
            _explicitBases  pushBack (configName _config);
            _inherited pushBack [];
        } else {
            if ((getNumber (_config >> "scope")) < 2) exitWith {};
            private _parent = inheritsFrom _config;
            while {isClass _parent} do {
                private _className = configName _parent;
                private _index = _explicitBases findIf {_className == _x};
                if (_index > -1) exitWith {
                    (_inherited select _index) pushBack (configName _config);
                };
                _parent = inheritsFrom _parent;
            };
        };
    };
} forEach _staticWeaponConfigs;
{
    INFO_2("%1 inherited by %2",_x,_inherited select _forEachIndex);
} forEach _explicitBases;




INFO("------ Logging static magazines with no carry version -------");
private _hash = [] call CBA_fnc_hashCreate;
// private _logAll = true; // logs all possible weapon magazines (even if not used in a static weapon)
private _logAll = false;
{
    private _vehicleType = configName _x;
    private _turretConfig = [_vehicleType, [0]] call CBA_fnc_getTurret;
    private _weapons = getArray (_turretConfig >> "weapons");
    private _loadedMags = getArray (_turretConfig >> "magazines");
    {
        private _weapMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
        {
            private _xMag = _x;
            private _groups = "getNumber (_x >> _xMag) == 1" configClasses (configFile >> QGVAR(groups));
            private _carryMag = configName (_groups param [0, configNull]);
            if ((_carryMag == "") && {_logAll || {_xMag in _loadedMags}}) then {
                private _vehs = [_hash, _xMag] call CBA_fnc_hashGet;
                if (isNil "_vehs") then {_vehs = [];};
                if (_xMag in _loadedMags) then {
                    _vehs pushBack _vehicleType;
                };
                [_hash, _xMag, _vehs] call CBA_fnc_hashSet;
            };
        } forEach _weapMags;
    } forEach _weapons;
} forEach _staticWeaponConfigs;

[_hash, {
    //IGNORE_PRIVATE_WARNING ["_key", "_value"];
    INFO_2("[%1] has no carry varient - Used in %2",_key,_value);
}] call CBA_fnc_hashEachPair;

INFO("------ End -------");
