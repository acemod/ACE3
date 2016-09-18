/*
 * Author: Glowbal
 * Parse the ACE_Medical_Advanced config for all injury types.
 *
 * Arguments:
 * None
 * ReturnValue:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private _injuriesRootConfig = (configFile >> "ACE_Medical_Injuries");
private _allFoundDamageTypes = [];
private _configDamageTypes = (_injuriesRootConfig >> "damageTypes");

// minimum lethal damage collection, mapped to damageTypes
private _defaultMinLethalDamage = getNumber (_configDamageTypes >> "lethalDamage");
GVAR(minLethalDamages) = [];
// Collect all available damage types from the config
for "_i" from 0 to (count _configDamageTypes -1) /* step +1 */ do {
    // Only get the subclasses in damageType class
    if (isClass(_configDamageTypes select _i)) then {
        _allFoundDamageTypes pushBack (configName (_configDamageTypes select _i));
        private _minLethalDamage = if (isNumber((_configDamageTypes select _i) >> "lethalDamage")) then {
            getNumber((_configDamageTypes select _i) >> "lethalDamage");
        } else {
            _defaultMinLethalDamage
        };

        GVAR(minLethalDamages) pushBack _minLethalDamage;
    };
};
GVAR(allAvailableDamageTypes) = _allFoundDamageTypes;
GVAR(woundClassNames) = [];
GVAR(fractureClassNames) = [];

private _getIfInConfig = {
    params ["_config", "_default"];
    if (_default isEqualType []) exitWith {
        if (isArray(_config)) then { getArray(_config)} else { _default };
    };
    if (_default isEqualType 0) exitWith {
        if (isNumber(_config)) then { getNumber(_config)} else { _default };
    };
    if (_default isEqualType "") exitWith {
        if (isText(_config)) then { getText(_config)} else { _default };
    };
    _default;
};

// Parsing the wounds
// function for parsing a sublcass of an injury
private _parseForSubClassWounds = {
    params ["_subClass"];
    if (isClass (_entry >> _subClass)) exitWith {
        private _subClassConfig = (_entry >> _subClass);
        private _subClassselections = [_subClassConfig >> "selections", _selections] call _getIfInConfig;
        private _subClasscauses = [_subClassConfig >> "causes", _causes] call _getIfInConfig;

        if (count _subClassselections > 0 && {count _subClasscauses > 0}) then {
            // constructs a type name, such as: 'woundMinor'
            GVAR(woundClassNames) pushBack (_classType + (configName _subClassConfig));
            _allWoundClasses pushBack [
                _classID,
                _subClassselections,
                [_subClassConfig >> "bleedingRate", _bloodLoss] call _getIfInConfig,
                [_subClassConfig >> "pain", _pain] call _getIfInConfig,
                [[_subClassConfig >> "minDamage", _minDamage] call _getIfInConfig, [_subClassConfig >> "maxDamage", _maxDamage] call _getIfInConfig],
                _subClasscauses,
                [_subClassConfig >> "name", (_classDisplayName + " " + _subClass)] call _getIfInConfig
            ];
            _classID = _classID + 1;
        };
        true;
    };
    false;
};

// TODO classTypes are strings currently. Convert them to unqiue IDs instead.
private _woundsConfig = (_injuriesRootConfig >> "wounds");
private _allWoundClasses = [];
private _classID = 0;
if (isClass _woundsConfig) then {
    private _amountOf = count _woundsConfig;
    for "_i" from 0 to (_amountOf -1) /* step +1 */ do {
        private _entry = _woundsConfig select _i;
        if (isClass _entry) then {
            private _classType = (ConfigName _entry);
            private _selections = if (isArray(_entry >> "selections")) then { getArray(_entry >> "selections");} else {[]};
            private _bloodLoss = if (isNumber(_entry >> "bleedingRate")) then { getNumber(_entry >> "bleedingRate");} else {0};
            private _pain = if (isNumber(_entry >> "pain")) then { getNumber(_entry >> "pain");} else {0};
            private _minDamage = if (isNumber(_entry >> "minDamage")) then { getNumber(_entry >> "minDamage");} else {0};
            private _maxDamage = if (isNumber(_entry >> "maxDamage")) then { getNumber(_entry >> "maxDamage");} else {-1};
            private _causes = if (isArray(_entry >> "causes")) then { getArray(_entry >> "causes");} else {[]};
            private _classDisplayName = if (isText(_entry >> "name")) then { getText(_entry >> "name");} else {_classType};

            // TODO instead of hardcoding minor, medium and large just go through all sub classes recursively until none are found
            if (["Minor"] call _parseForSubClassWounds || ["Medium"] call _parseForSubClassWounds || ["Large"] call _parseForSubClassWounds) exitWith {}; // continue to the next one

            // There were no subclasses, so we will add this one instead.
            if (count _selections > 0 && count _causes > 0) then {
                GVAR(woundClassNames) pushBack _classType;
                _allWoundClasses pushBack [_classID, _selections, _bloodLoss, _pain, [_minDamage, _maxDamage], _causes, _classDisplayName];
                _classID = _classID + 1;
            };
            true;
        };
    };
};
GVAR(AllWoundInjuryTypes) = _allWoundClasses;

// Linking injuries to the woundInjuryType variables.
private _damageTypesConfig = (_injuriesRootConfig >> "damageTypes");
private _thresholds = getArray(_damageTypesConfig >> "thresholds");
private _selectionSpecific = getNumber(_damageTypesConfig >> "selectionSpecific");
{
    private _varName = format[QGVAR(woundInjuryType_%1),_x];
    private _woundTypes = [];
    private _type = _x;
    {
        // Check if this type is in the causes of a wound class, if so, we will store the wound types for this damage type
        if (_type in (_x select 5)) then {
            _woundTypes pushBack _x;
        };
    } forEach _allWoundClasses;
    private _typeThresholds = _thresholds;
    private _selectionSpecificType = _selectionSpecific;
    if (isClass(_damageTypesConfig >> _x)) then {
        if (isArray(_damageTypesConfig >> _x >> "thresholds")) then { _typeThresholds = getArray(_damageTypesConfig >> _x >> "thresholds");};
        if (isNumber(_damageTypesConfig >> _x >> "selectionSpecific")) then { _selectionSpecificType = getNumber(_damageTypesConfig >> _x >> "selectionSpecific");};
    };

    // TODO use CBA namespace
    missionNamespace setVariable [_varName, [_typeThresholds, _selectionSpecificType > 0, _woundTypes]];

    // extension loading
    private _minDamageThresholds = "";
    private _amountThresholds = "";
    {
        _minDamageThresholds = _minDamageThresholds + str(_x select 0);
        _amountThresholds = _amountThresholds + str(_x select 1);
        if (_forEachIndex < (count _typeThresholds) - 1) then {
            _minDamageThresholds = _minDamageThresholds + ":";
            _amountThresholds = _amountThresholds + ":";
        };
    } forEach _typeThresholds;

    // load in the damage types into the medical extension
    private _extensionRes = "ace_medical" callExtension format ["addDamageType,%1,%2,%3,%4,%5",
        _type,
        GVAR(minLethalDamages) select _forEachIndex,
        _minDamageThresholds,
        _amountThresholds,
        _selectionSpecificType
    ];
    TRACE_1("",_extensionRes);
} forEach _allFoundDamageTypes;

// Extension loading
{
    _x params ["_classID", "_selections", "_bloodLoss", "_pain", "_damage", "_causesArray", "_classDisplayName"];
    _damage params ["_minDamage", "_maxDamage"];
    private _className = GVAR(woundClassNames) select _forEachIndex;
    private _allowedSelections = "";
    {
        _allowedSelections = _allowedSelections + _x;
        if (_forEachIndex < (count _selections) - 1) then {
            _allowedSelections = _allowedSelections + ":";
        };
    } forEach _selections;

    private _causes = "";
    {
        _causes = _causes + _x;
        if (_forEachIndex < (count _causesArray) - 1) then {
            _causes = _causes + ":";
        };
    } forEach _causesArray;

    private _extensionArgs = format ["addInjuryType,%1,%2,%3,%4,%5,%6,%7,%8,%9", _classID, _className, _allowedSelections, _bloodLoss, _pain, _minDamage, _maxDamage, _causes, _classDisplayName];
    TRACE_1("",_extensionArgs);

    private _extensionRes = "ace_medical" callExtension _extensionArgs;
    TRACE_1("",_extensionRes);

} forEach _allWoundClasses;

"ace_medical" callExtension "ConfigComplete";
