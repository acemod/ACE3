#include "..\script_component.hpp"
/*
 * Author: commy2
 * Called on unit initialization. Adds earplugs if the unit is equipped with either a really loud primary weapon or a rocket launcher.
 *
 * Arguments:
 * 0: Unit <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [guy] call ace_hearing_fnc_addEarPlugs
 *
 * Public: No
 */

// Only run this after the settings are initialized
if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [LINKFUNC(addEarPlugs), _this];
};

// Exit if hearing is disabled or if autoAdd is disabled
if (!GVAR(enableCombatDeafness) || {GVAR(autoAddEarplugsToUnits) == 0}) exitWith {};

params ["_unit"];
TRACE_2("params",_unit,typeOf _unit);

// Exit if the unit already has earplugs (in ears (persistence scenarios) or inventory)
if ((_unit getVariable ["ACE_hasEarPlugsIn", false]) || {[_unit, "ACE_EarPlugs"] call EFUNC(common,hasItem)}) exitWith {};

// Add earplugs if enabled for everyone or if the unit has a rocket launcher
if (GVAR(autoAddEarplugsToUnits) == 2 || {(secondaryWeapon _unit) != ""}) exitWith {
    TRACE_1("has launcher - adding",_unit);
    _unit addItem "ACE_EarPlugs";
};

// Otherwise add earplugs if the unit has a big rifle
private _weapon = primaryWeapon _unit;

if (_weapon == "") exitWith {};

if (isNil QGVAR(cacheMaxAmmoLoudness)) then {
    GVAR(cacheMaxAmmoLoudness) = createHashMap;
};

// Cache maximum loudness for future calls
private _maxLoudness = GVAR(cacheMaxAmmoLoudness) getOrDefaultCall [_weapon, {
    // Get the weapon's compatible magazines, so that all magazines are cached
    // From all the loudness factors, take the max
    private _maxLoudness = selectMax ((compatibleMagazines _weapon) apply {_x call FUNC(getAmmoLoudness)});

    // ace_gunbag_fnc_isMachineGun
    private _config = _weapon call CBA_fnc_getItemConfig;

    // Definition of a machine gun by BIS_fnc_itemType
    private _cursor = getText (_config >> "cursor");

    if (toLowerANSI _cursor in ["", "emptycursor"]) then {
        _cursor = getText (_config >> "cursorAim");
    };

    // If unit has a machine gun boost effective loudness 50%
    if (_cursor == "MG") then {
        _maxLoudness = _maxLoudness * 1.5;
    };

    _maxLoudness
}, true];

TRACE_3("primaryWeapon",_unit,_weapon,_maxLoudness);

if (_maxLoudness > 0.2) then {
    TRACE_1("loud gun - adding",_unit);
    _unit addItem "ACE_EarPlugs";
};
