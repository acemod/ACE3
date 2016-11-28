/*
 * Author: Glowbal, commy2
 * Parse the ACE_Medical_Advanced config for all injury types.
 *
 * Arguments:
 * None
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private _fnc_getAnyFromConfig = {
    params ["_config", "_default"];

    if (_default isEqualType []) exitWith {
        GET_ARRAY(_config,_default)
    };

    if (_default isEqualType 0) exitWith {
        GET_NUMBER(_config,_default)
    };

    if (_default isEqualType "") exitWith {
        GET_STRING(_config,_default)
    };

    _default
};

private _fnc_parseSubClassWounds = {
    params ["_subClass"];

    private _subClassConfig = _entry >> _subClass;

    if (isClass _subClassConfig) exitWith {
        private _subClassSelections = [_subClassConfig >> "selections", _selections] call _fnc_getAnyFromConfig;
        private _subClassCauses = [_subClassConfig >> "causes", _causes] call _fnc_getAnyFromConfig;
        private _subClassLethalities = [_subClassConfig >> "lethalities", _lethalities] call _fnc_getAnyFromConfig;

        if (count _subClassSelections > 0 && {count _subClassCauses > 0}) then {
            // constructs a type name, such as: 'woundMinor'
            GVAR(woundClassNames) pushBack (_className + configName _subClassConfig);
            GVAR(woundsData) pushBack [
                _classID,
                _subClassSelections,
                [_subClassConfig >> "bleedingRate", _bleedingRate] call _fnc_getAnyFromConfig,
                [_subClassConfig >> "pain", _pain] call _fnc_getAnyFromConfig,
                [[_subClassConfig >> "minDamage", _minDamage] call _fnc_getAnyFromConfig, [_subClassConfig >> "maxDamage", _maxDamage] call _fnc_getAnyFromConfig],
                _subClassCauses,
                [_subClassConfig >> "name", _displayName + " " + _subClass] call _fnc_getAnyFromConfig,
                _subClassLethalities
            ];

            _classID = _classID + 1;
        };

        true
    };

    false
};

private _injuriesConfigRoot = configFile >> "ACE_Medical_Injuries";

// --- parse wounds
GVAR(woundClassNames) = [];
GVAR(woundsData) = []; // @todo classTypes are strings currently. Convert them to unqiue IDs instead.

private _woundsConfig = _injuriesConfigRoot >> "wounds";
private _classID = 0;

{
    private _entry = _x;
    private _className = configName _entry;

    private _selections = GET_ARRAY(_entry >> "selections",[]);
    private _bleedingRate = GET_NUMBER(_entry >> "bleedingRate",0);
    private _pain = GET_NUMBER(_entry >> "pain",0);
    private _minDamage = GET_NUMBER(_entry >> "minDamage",0);
    private _maxDamage = GET_NUMBER(_entry >> "maxDamage",-1);
    private _causes = GET_ARRAY(_entry >> "causes",[]);
    private _displayName = GET_STRING(_entry >> "name",_className); // @todo, don't translate in config
    private _lethalities = GET_ARRAY(_entry >> "lethalities",[]);

    // TODO instead of hardcoding minor, medium and large just go through all sub classes recursively until none are found
    if !("Minor" call _fnc_parseSubClassWounds || "Medium" call _fnc_parseSubClassWounds || "Large" call _fnc_parseSubClassWounds) then {
        // There were no subclasses, so we will add this one instead.
        if (count _selections > 0 && {count _causes > 0}) then {
            GVAR(woundClassNames) pushBack _className;
            GVAR(woundsData) pushBack [_classID, _selections, _bleedingRate, _pain, [_minDamage, _maxDamage], _causes, _displayName, _lethalities];
            _classID = _classID + 1;
        };
    };
} forEach configProperties [_woundsConfig, "isClass _x"];

// --- parse fractures
//GVAR(fractureClassNames) = []; // unused

// --- parse damage types
GVAR(allDamageTypes) = []; // @todo, currently unused by handle damage (was GVAR(allAvailableDamageTypes))
GVAR(lethalDamages) = []; // @todo, currently unused by handle damage (was GVAR(minLethalDamages))
GVAR(allDamageTypesData) = [] call CBA_fnc_createNamespace;

// minimum lethal damage collection, mapped to damageTypes
private _damageTypesConfig = _injuriesConfigRoot >> "damageTypes";
private _lethalDamageDefault = getNumber (_damageTypesConfig >> "lethalDamage");
private _thresholdsDefault = getArray (_damageTypesConfig >> "thresholds");
private _selectionSpecificDefault = getNumber (_damageTypesConfig >> "selectionSpecific");

// Collect all available damage types from the config
{
    private _entry = _x;
    private _className = configName _entry;

    GVAR(allDamageTypes) pushBack _className;
    GVAR(lethalDamages) pushBack GET_NUMBER(_entry >> "lethalDamage",_lethalDamageDefault);

    // Check if this type is in the causes of a wound class, if so, we will store the wound types for this damage type
    private _woundTypes = [];
    {
        if (_className in (_x select 5)) then {
            _woundTypes pushBack _x;
        };
    } forEach GVAR(woundsData);

    private _damageTypeSubClassConfig = _damageTypesConfig >> _className;

    private _thresholds = GET_ARRAY(_damageTypeSubClassConfig >> "thresholds",_thresholdsDefault);
    private _selectionSpecific = GET_NUMBER(_damageTypeSubClassConfig >> "selectionSpecific",_selectionSpecificDefault);

    GVAR(allDamageTypesData) setVariable [_className, [_thresholds, _selectionSpecific > 0, _woundTypes]];

    // extension loading
    private _minDamageThresholds = (_thresholds apply {str (_x select 0)}) joinString ":";
    private _amountThresholds = (_thresholds apply {str (_x select 1)}) joinString ":";

    // load in the damage types into the medical extension
    private _extensionArgs = format [
        "addDamageType,%1,%2,%3,%4,%5",
        _className,
        GVAR(lethalDamages) select _forEachIndex,
        _minDamageThresholds,
        _amountThresholds,
        _selectionSpecific
    ];
    TRACE_1("",_extensionArgs);

    private _extensionRes = "ace_medical" callExtension _extensionArgs;
    TRACE_1("",_extensionRes);
} forEach configProperties [_damageTypesConfig, "isClass _x"];

// extension loading
{
    _x params ["_classID", "_selections", "_bleedingRate", "_pain", "_damageExtrema", "_causes", "_displayName"];
    _damageExtrema params ["_minDamage", "_maxDamage"];

    private _className = GVAR(woundClassNames) select _forEachIndex;

    if (_displayName isEqualTo "") then {
        _displayName = _className;
    };

    private _selections = _selections joinString ":";
    private _causes = _causes joinString ":";

    private _extensionArgs = format [
        "addInjuryType,%1,%2,%3,%4,%5,%6,%7,%8,%9",
        _classID,
        _className,
        _selections,
        _bleedingRate,
        _pain,
        _minDamage,
        _maxDamage,
        _causes,
        _displayName
    ];
    TRACE_1("",_extensionArgs);

    private _extensionRes = "ace_medical" callExtension _extensionArgs;
    TRACE_1("",_extensionRes);
} forEach GVAR(woundsData);

"ace_medical" callExtension "ConfigComplete";
