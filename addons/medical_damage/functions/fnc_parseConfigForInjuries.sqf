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
GVAR(woundsData) = [];

private _woundsConfig = _injuriesConfigRoot >> "wounds";
private _classID = 0;

{
    private _entry = _x;
    private _className = configName _entry;

    private _selections = GET_ARRAY(_entry >> "selections",["All"]);
    private _bleeding = GET_NUMBER(_entry >> "bleeding",0);
    private _pain = GET_NUMBER(_entry >> "pain",0);
    private _minDamage = GET_NUMBER(_entry >> "minDamage",0);
    private _maxDamage = GET_NUMBER(_entry >> "maxDamage",-1);
    private _causes = GET_ARRAY(_entry >> "causes",[]);
    private _causeLimping = GET_NUMBER(_entry >> "causeLimping",0) == 1;
    private _causeFracture = GET_NUMBER(_entry >> "causeFracture",0) == 1;

    if !(_causes isEqualTo []) then {
        GVAR(woundClassNames) pushBack _className;
        GVAR(woundsData) pushBack [_classID, _selections, _bleeding, _pain, [_minDamage, _maxDamage], _causes, _className, _causeLimping, _causeFracture];
        {
            GVAR(woundClassNamesComplex) set [10 * _classID + _forEachIndex, format ["%1%2", _className, _x]];
        } forEach ["Minor", "Medium", "Large"];
        _classID = _classID + 1;
    };
} forEach configProperties [_woundsConfig, "isClass _x"];

// --- parse damage types
GVAR(allDamageTypesData) = [] call CBA_fnc_createNamespace;

// minimum lethal damage collection, mapped to damageTypes
private _damageTypesConfig = _injuriesConfigRoot >> "damageTypes";
private _thresholdsDefault = getArray (_damageTypesConfig >> "thresholds");
private _selectionSpecificDefault = getNumber (_damageTypesConfig >> "selectionSpecific");

// Collect all available damage types from the config
{
    private _entry = _x;
    private _className = configName _entry;

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
