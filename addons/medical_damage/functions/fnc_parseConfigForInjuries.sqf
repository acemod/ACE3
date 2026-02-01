#include "..\script_component.hpp"
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
 * Example:
 * [] call ace_medical_damage_fnc_parseConfigForInjuries
 *
 * Public: No
 */

private _injuriesConfigRoot = configFile >> "ACE_Medical_Injuries";

// --- parse wounds
GVAR(woundClassNames) = [];
GVAR(woundClassNamesComplex) = []; // index = 10 * classID + category; [will contain nils] e.g. ["aMinor", "aMed", "aLarge", nil, nil..."bMinor"]
GVAR(woundDetails) = createHashMap;

private _woundsConfig = _injuriesConfigRoot >> "wounds";
private _classID = 0;

{
    private _entry = _x;
    private _className = configName _entry;

    private _selections = GET_ARRAY(_entry >> "selections",["All"]);
    private _bleeding = GET_NUMBER(_entry >> "bleeding",0);
    private _pain = GET_NUMBER(_entry >> "pain",0);
    private _causeLimping = GET_NUMBER(_entry >> "causeLimping",0) == 1;
    private _causeFracture = GET_NUMBER(_entry >> "causeFracture",0) == 1;

    private _details = [_selections, _bleeding, _pain, _causeLimping, _causeFracture];
    GVAR(woundDetails) set [_className, _details];
    GVAR(woundDetails) set [_classID, _details];

    GVAR(woundClassNames) pushBack _className;
    {
        GVAR(woundClassNamesComplex) set [10 * _classID + _forEachIndex, format ["%1%2", _className, _x]];
    } forEach ["Minor", "Medium", "Large"];
    _classID = _classID + 1;
} forEach ("true" configClasses _woundsConfig);

// --- parse damage types
GVAR(damageTypeDetails) = createHashMap;
// cache for ammunition -> damageType
GVAR(damageTypeCache) = createHashMap;

// minimum lethal damage collection, mapped to damageTypes
private _damageTypesConfig = _injuriesConfigRoot >> "damageTypes";
private _thresholdsDefault = getArray (_damageTypesConfig >> "thresholds");
private _selectionSpecificDefault = getNumber (_damageTypesConfig >> "selectionSpecific");

private _defaultWoundHandlers = [];
if (isClass (_damageTypesConfig >> "woundHandlers")) then {
    _defaultWoundHandlers = [_damageTypesConfig >> "woundHandlers"] call FUNC(parseWoundHandlersCfg);
    reverse _defaultWoundHandlers;
};
TRACE_1("Found default wound handlers",count _defaultWoundHandlers);

// Collect all available damage types from the config
{
    private _entry = _x;
    private _className = configName _entry;

    if (_className == "woundHandlers") then {continue};

    GVAR(damageTypeCache) set [_className, _className];
    GVAR(damageTypeCache) set ["#"+_className, _className];

    private _damageTypeSubClassConfig = _damageTypesConfig >> _className;

    private _thresholds = GET_ARRAY(_damageTypeSubClassConfig >> "thresholds",_thresholdsDefault);
    private _selectionSpecific = GET_NUMBER(_damageTypeSubClassConfig >> "selectionSpecific",_selectionSpecificDefault);

    private _woundHandlers = [];
    if (isClass (_damageTypeSubClassConfig >> "woundHandlers")) then {
        _woundHandlers = [_damageTypeSubClassConfig >> "woundHandlers"] call FUNC(parseWoundHandlersCfg);
        reverse _woundHandlers;
        TRACE_2("Damage type found wound handlers",_className,count _woundHandlers);
    } else {
        _woundHandlers = _defaultWoundHandlers;
        TRACE_1("Damage type has no wound handlers, using default",_className);
    };

    if (_woundHandlers isEqualTo []) then {
        if (_className == "drowning") exitWith {};
        INFO_1("damage type [%1] has no wound handlers",_className);
    };

    // parse config for each wound this damage type can cause
    private _damageWoundDetails = [];
    {
        private _woundType = configName _x;
        if (_woundType == "woundHandlers") then {continue};
        if (_woundType in GVAR(woundDetails)) then {
            private _weighting = GET_ARRAY(_x >> "weighting",[[ARR_2(0,1)]]);
            private _dmgMulti = GET_NUMBER(_x >> "damageMultiplier",1);
            private _bleedMulti = GET_NUMBER(_x >> "bleedingMultiplier",1);
            private _sizeMulti = GET_NUMBER(_x >> "sizeMultiplier",1);
            private _painMulti = GET_NUMBER(_x >> "painMultiplier",1);
            private _fractureMulti = GET_NUMBER(_x >> "fractureMultiplier",1);
            _damageWoundDetails pushBack [_woundType, _weighting, _dmgMulti, _bleedMulti, _sizeMulti, _painMulti, _fractureMulti];
        } else {
            WARNING_2("Damage type %1 refers to wound %2, but it doesn't exist: skipping.",_className,configName _x);
        };
    } forEach configProperties [_damageTypeSubClassConfig, "isClass _x"]; // Subclasses can be inherited

    GVAR(damageTypeDetails) set [_className, [_thresholds, _selectionSpecific, _woundHandlers, _damageWoundDetails]];
} forEach ("true" configClasses _damageTypesConfig); // damageTypes doesn't inherit, so use faster command
