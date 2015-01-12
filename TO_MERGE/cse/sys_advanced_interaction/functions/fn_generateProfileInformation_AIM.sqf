/**
 * fn_generateProfileInformation_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define SELECT_RANDOM_ITEM(ARRAY) ARRAY select (round(random(count ARRAY -1)));

private ["_unit","_occupation","_dateOfBirth","_politicalViews","_culture","_homeTown", "_availableCultures","_availableOccupations", "_availablePoliticalStances", "_availableSidesToSupport", "_availableHomeTown", "_supportedSides", "_profile"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;

_occupation = "Soldier";
_dateOfBirth = "0/0/0";
_politicalViews = ["Unknown"];
_culture = "Unknown";
_homeTown = "Unknown";

_sideOfUnit = side _unit;
_factionOfUnit = faction _unit;

_availableCultures = [_unit, _sideOfUnit, _factionOfUnit,"Cultures"] call cse_fnc_getAvailableProfileSetsFor_AIM;
_availableOccupations = [_unit, _sideOfUnit, _factionOfUnit,"Occupations"] call cse_fnc_getAvailableProfileSetsFor_AIM;
_availablePoliticalStances = [_unit, _sideOfUnit, _factionOfUnit,"PoliticalViews"] call cse_fnc_getAvailableProfileSetsFor_AIM;
_availableSidesToSupport = [_unit, _sideOfUnit, _factionOfUnit,"SupportedSides"] call cse_fnc_getAvailableProfileSetsFor_AIM;
_availableHomeTown = [_unit, _sideOfUnit, _factionOfUnit,"homeTown"] call cse_fnc_getAvailableProfileSetsFor_AIM;


_occupation = SELECT_RANDOM_ITEM(_availableOccupations);
_dateOfBirth = SELECT_RANDOM_ITEM(["Unknown"]);
_politicalViews = SELECT_RANDOM_ITEM(_availablePoliticalStances);
_culture = SELECT_RANDOM_ITEM(_availableCultures);
_supportedSides = SELECT_RANDOM_ITEM(_availableSidesToSupport);
_homeTown = SELECT_RANDOM_ITEM(_availableHomeTown);

_profile = [_occupation, _dateOfBirth, _politicalViews, _culture, _supportedSides, _homeTown];

[_unit, "cse_profile_information_aim", _profile] call cse_fnc_setVariable;