#include "script_component.hpp"

//get EH params
params ["_shooter", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_instigator"];

//if not local, bail
if(!local _projectile) exitWith {};

//Initialize Legacy Wrapper for old ACE_missileGuidance projectiles;
private _legacyEnabled = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_missileGuidance" >> "enabled");
if(_legacyEnabled > 0) then {
    private _legacyConfigProperties = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE("ACE_missileGuidance")), false];
    if(count _legacyConfigProperties > 0) exitWith {
        _this call FUNC(onFiredLegacy);
    };
};

//If not enabled or is a countermeasure; bail
private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);
private _enabledNumber = getNumber (_cfgAmmo >> "enabled");
if (_enabledNumber == 3) exitWith {
    private _countermeasureTypes = getArray (_cfg >> "countermeasureType");
    GVAR(countermeasures) pushback [_projectile, _countermeasureTypes, true];
};

if(_enabledNumber < 1) exitWith {}; 

//If no explicit inheritence and it's required; bail
// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
private _explicitInheritance = getNumber (_cfg >> "explicitInheritance");
if (_explicitInheritance > 0 && ((count _configs) < 1)) exitWith {};


private _isAI = false;
if ( !((_shooter == ACE_Player)||(_instigator == ACE_Player)) ) then {
    _isAI == true;
};


//FIND ENTRY
private _unitList = GVAR(guidedWeapons);
private _unitIndex = -1;
{
    if (_x select 0 == _shooter) then {
        _unitIndex = _forEachIndex;
    };
} forEach _unitList;

private _weaponList = _unitList select _unitIndex select 1;
private _weaponIndex = -1;
{
    if (_x select 0 == _weapon) then {
        _weaponIndex = _forEachIndex;
    };
} forEach _weaponList;


private _magazineList = _weaponList select _weaponIndex select 1;
private _magazineIndex = -1;
{
    if (_x select 0 == _magazine) then {
        _magazineIndex = _forEachIndex;
    };
} forEach _magazineList;


private _seekerList = (_magazineList select _magazineIndex select 1);
private _seekerListCopy = +_seekerList;


private _weaponDirection = _shooter weaponDirection _weapon;
private _projectileDir = vectorDir _projectile;
private _angDif = acos (_weaponDirection vectorDotProduct _projectileDir);
private _crossVector = _weaponDirection vectorCrossProduct _projectileDir;



{
    private _y = _x;
    // _y params ["_object", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];
    _y set [0, _projectile];
    _y set [1, str _projectile]; // _weapon
    _y set [2, str _projectile]; // _magazine
    _y set [4, true]; // _enabled
    _y set [6, [_y select 6, _crossVector, _angDif] call CBA_fnc_vectRotate3D]; // _seekerLookVector
    _y set [7, _projectile vectorWorldToModel (_y select 6)];
    _y set [8, false]; // _caged
    _y set [10, true]; // _tracking
    _y set [11, true]; // _launched
    _y set [13, +(_y select 13)]; // _sensorArray;
    _y set [14, +(_this)]; // _seekerEH;
    _y set [15, +(_y select 15)]; // _seekerMisc;
    {
        // _x params ["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_priority", "_lastSensorReturns", "_sensorMisc"];
        _x set [0, _projectile]; 
        _x set [4, true]; // _enabled;
        GVAR(sensors) pushBack _x;
    } forEach (_y select 13); // _sensorArray
    GVAR(seekers) pushback _y;
} forEach _seekerListCopy;


private _fuze = [];

private _degreesPerSecond = getNumber (_cfgAmmo >> "degreesPerSecond");

if (isNil "_degreesPerSecond") then {

    ///DEBUG!!
    private _degreesPerSecond = 25;
    ///
    switch (true) do {
        case (_projectile isKindOf "ammo_Bomb_SmallDiameterBase") : {
            _degreesPerSecond = 20;
        };
        case (_projectile isKindOf "LaserBombCore") : {
            _degreesPerSecond = 5;
        };
        case (_projectile isKindOf "MissileBase") : {
            _degreesPerSecond = 20;
        };
    };
};


_degreesPerSecond = 25;

//private _flightProfileType = [_ammo, _mode, _aceMode] call FUNC(getflightProfile);



//seeker params ["_seekerObject", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];


//_flightProfile params ["_flightProfileObject", "_flightProfileType", "_flightProfileSeekers", "_lastflightProfileReturns", "_flightProfileMisc"];
//_lastflightProfileReturns params ["_lastProfileReturnVector", "_lastProfileReturnPos"];
private _flightProfile = [_projectile, "", _seekerListCopy, [[0, 0, 0], [0, 0, 0]], []];
GVAR(flightProfiles) pushback _flightProfile;


// _flightParams params ["_degreesPerSecond", "_launchTime", "_launchPos", "_launchVector", "_aimVector"];
private _flightParams = [_degreesPerSecond, time, _projectile modelToWorldVisualWorld [0, 0, 0], vectorDir _projectile]; 
// _projectile params ["_object", "_eh", "_fuze", "_seekers", "_flightProfile", "_flightParams"];
GVAR(projectiles) pushback [_projectile, _this, _fuze, _seekerListCopy, _flightProfile, _flightParams];

//
private _magazinesRemaining = magazines _shooter;
if ( ((_magazinesRemaining find _magazine) < 0) && ((_shooter ammo _muzzle) == 0) ) then {
    private _unitList = GVAR(guidedWeapons);
    private _weaponList = _unitList select _unitIndex select 1;
    private _magazineList = _weaponList select _weaponIndex select 1;
    private _seekerList = _magazineList select _magazineIndex select 1;
    {
        private _y = _x;
        {
            _x set [0, objNull];
        } forEach (_y select 13); // _sensorArray;
        _y set [0, objNull]; // _object
        _y set [13, []]; // _sensorArray
    } forEach _seekerList; 
    (_magazineList select _magazineIndex) set [1, []]; // clear _magazineIndex;
    _magazineList deleteAt _magazineIndex;
    if (count _magazineList == 0) then {
        _weaponList select _weaponIndex set [1, []]; // clear _weaponIndex if empty;
        _weaponList deleteAt _weaponIndex;
    };
    if (count _weaponList == 0) then {
        _unitList select _unitIndex set [1, []]; // clear _unitIndex (GVAR(guidedWeapons)) if empty;
        _unitList deleteAt _unitIndex;
    };
};

