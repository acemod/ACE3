#include "..\script_component.hpp"

// Dev only function to search for weapons used by static weapons
// and check if their magazinese are compatible
INFO("Checking static weapons");

private _staticWeaponConfigs = "(configName _x) isKindOf 'StaticWeapon'" configClasses (configFile >> "CfgVehicles");
private _staticPublic = _staticWeaponConfigs select {(getNumber (_x >> "scope")) == 2};
INFO_2("Static Weapons [%1] - CSW Enabled [%2]",count _staticPublic,{(getNumber (_x >> QUOTE(ADDON) >> "enabled")) == 1} count _staticPublic);

INFO("------ Checking static weapons inheritance ------");
private _explicitBases = [];
private _inherited = [];
{
    private _config = _x;
    private _configEnabled = (getNumber (_config >> QUOTE(ADDON) >> "enabled")) == 1;
    if (_configEnabled) then {
        private _configExplicit = (QUOTE(configName _x == QUOTE(QUOTE(ADDON))) configClasses _config) isNotEqualTo [];
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
private _hash = createHashMap;
private _logAll = false; // logs all possible weapon magazines (even if not used in a static weapon) when set to true

{
    private _vehicleType = configName _x;
    private _turretConfig = [_vehicleType, [0]] call CBA_fnc_getTurret;
    private _weapons = getArray (_turretConfig >> "weapons");
    private _loadedMags = getArray (_turretConfig >> "magazines");
    {
        private _weapMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
        {
            private _xMag = _x;
            private _groups = "getNumber (_x >> _xMag) == 1 && {isClass (configFile >> 'CfgMagazines' >> configName _x)}" configClasses (configFile >> QGVAR(groups));
            private _carryMag = configName (_groups param [0, configNull]);
            if ((_carryMag == "") && {_logAll || {_xMag in _loadedMags}}) then {
                private _vehs = _hash getOrDefault [_xMag, []];
                if (_xMag in _loadedMags) then {
                    _vehs pushBack _vehicleType;
                };
                _hash set [_xMag, _vehs];
            };
        } forEach _weapMags;
    } forEach _weapons;
} forEach _staticWeaponConfigs;

{
    INFO_2("[%1] has no carry variant - Used in %2",_x,_y);
} forEach _hash;

INFO("------ End -------");
