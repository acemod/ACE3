#include "script_component.hpp"
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
} forEach configProperties [_woundsConfig, "isClass _x"];

// --- parse damage types
GVAR(damageTypeDetails) = createHashMap;
// cache for ammunition -> damageType
GVAR(damageTypeCache) = createHashMap;

// minimum lethal damage collection, mapped to damageTypes
private _damageTypesConfig = _injuriesConfigRoot >> "damageTypes";
private _thresholdsDefault = getArray (_damageTypesConfig >> "thresholds");
private _selectionSpecificDefault = getNumber (_damageTypesConfig >> "selectionSpecific");
private _woundsHandlerDefault = getText (_damageTypesConfig >> "woundsHandler");
FUNC(defaultWoundHandler) = missionNamespace getVariable [_woundsHandlerDefault, FUNC(woundsHandlerActive)];

// Collect all available damage types from the config
{
    private _entry = _x;
    private _className = configName _entry;

    GVAR(damageTypeCache) set [_className, _className];
    GVAR(damageTypeCache) set ["#"+_className, _className];

    private _damageTypeSubClassConfig = _damageTypesConfig >> _className;

    private _thresholds = GET_ARRAY(_damageTypeSubClassConfig >> "thresholds",_thresholdsDefault);
    private _selectionSpecific = GET_NUMBER(_damageTypeSubClassConfig >> "selectionSpecific",_selectionSpecificDefault);
    private _woundsHandler = GET_STRING(_damageTypeSubClassConfig >> "woundsHandler",_woundsHandlerDefault);

    /*
    // extension loading
    private _minDamageThresholds = (_thresholds apply {str (_x select 0)}) joinString ":";
    private _amountThresholds = (_thresholds apply {str (_x select 1)}) joinString ":";

    // load in the damage types into the medical extension
    private _extensionArgs = format [
        "addDamageType,%1,%2,%3,%4,%5",
        _className,
        1, //@todo remove 'minLethalDamage' from extension
        _minDamageThresholds,
        _amountThresholds,
        _selectionSpecific
    ];
    TRACE_1("",_extensionArgs);

    // private _extensionRes = "ace_medical" callExtension _extensionArgs;
    // TRACE_1("",_extensionRes);
    */

    // parse config for each wound this damage type can cause
    private _damageWoundDetails = [];
    {
        private _woundType = configName _x;
        if (_woundType in GVAR(woundDetails)) then {
            private _weighting = GET_ARRAY(_x >> "weighting",ARR_2([[0,1]]));
            private _dmgMulti = GET_NUMBER(_x >> "damageMultiplier", 1);
            private _bleedMulti = GET_NUMBER(_x >> "bleedingMultiplier", 1);
            private _sizeMulti = GET_NUMBER(_x >> "sizeMultiplier", 1);
            private _painMulti = GET_NUMBER(_x >> "painMultiplier", 1);
            private _fractureMulti = GET_NUMBER(_x >> "fractureMultiplier", 1);
            _damageWoundDetails pushBack [_woundType, _weighting, _dmgMulti, _bleedMulti, _sizeMulti, _painMulti, _fractureMulti];
        } else {
            WARNING_2("Damage type %1 refers to wound %2, but it doesn't exist: skipping.",_className,className _x);
        };
    } forEach configProperties [_damageTypeSubClassConfig, "isClass _x"];

    GVAR(damageTypeDetails) set [_className, [_thresholds, _selectionSpecific, _woundsHandler, _damageWoundDetails]];
} forEach configProperties [_damageTypesConfig, "isClass _x"];

/*
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

    // private _extensionRes = "ace_medical" callExtension _extensionArgs;
    // TRACE_1("",_extensionRes);
} forEach GVAR(woundsData);

// "ace_medical" callExtension "ConfigComplete";
*/
