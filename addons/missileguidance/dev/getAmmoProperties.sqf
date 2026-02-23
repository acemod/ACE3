#include "..\script_component.hpp"

private _configs =  QUOTE(isClass (_x >> QUOTE(QUOTE(ADDON)))) configClasses (configFile >> "CfgAmmo");

private _seekerTypes = createHashMap;
private _navigationTypes = createHashMap;
private _attackProfiles = createHashMap;
{
    private _seekerType = getText (_x >> QUOTE(ADDON) >> "defaultSeekerType");
    private _navigationType = getText (_x >> QUOTE(ADDON) >> "defaultNavigationType");
    private _attackProfile = getText (_x >> QUOTE(ADDON) >> "defaultAttackProfile");

    private _seekers = _seekerTypes getOrDefault [_seekerType, []];
    private _navigations = _navigationTypes getOrDefault [_navigationType, []];
    private _attacks = _attackProfiles getOrDefault [_attackProfile, []];

    _seekers pushBack configName _x;
    _navigations pushBack configName _x;
    _attacks pushBack configName _x;

    _seekerTypes set [_seekerType, _seekers];
    _navigationTypes set [_navigationType, _navigations];
    _attackProfiles set [_attackProfile, _attacks];
} forEach _configs;

[_seekerTypes, _navigationTypes, _attackProfiles]
