#include "..\script_component.hpp"
/*
 * Author: commy2
 * Called on unit initialization. Adds earplugs if the unit is equipped with either a really loud primary weapon or a rocket launcher.
 *
 * Arguments:
 * 0: A Soldier <Object>
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
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addEarPlugs), _this];
};

params ["_unit"];
TRACE_2("params",_unit,typeOf _unit);

// Exit if hearing is disabled OR autoAdd is disabled OR soldier has earplugs already in (persistence scenarios)
if (
    !GVAR(enableCombatDeafness) ||
    {!GVAR(autoAddEarplugsToUnits)} ||
    {[_unit] call FUNC(hasEarPlugsIn)} ||
    {[_unit, "ACE_EarPlugs"] call EFUNC(common,hasItem)} // don't give earplugs if they already have them
) exitWith {};

// Add earplugs if the soldier has a rocket launcher
if ((secondaryWeapon _unit) != "") exitWith {
    TRACE_1("has launcher - adding",_unit);
    _unit addItem "ACE_EarPlugs";
};

private _weapon = primaryWeapon _unit;

// Otherwise add earplugs if the soldier has a big rifle
if (_weapon == "") exitWith {};

// Cache maximum loadness for future calls
private _maxLoudness = GVAR(cacheMaxAmmoLoudness) getOrDefaultCall [_weapon, {
    private _cfgMagazines = configFile >> "CfgMagazines";

    // Get the weapon's compatible magazines, so that all magazines are cached
    private _maxLoudness = selectMax ((compatibleMagazines _weapon) apply {
        private _magazine = _x;
        private _cfgMagazine = _cfgMagazines >> _magazine;
        private _ammo = getText (_cfgMagazine >> "ammo");

        GVAR(cacheAmmoLoudness) getOrDefaultCall [_magazine, {
            private _cfgAmmo = configFile >> "CfgAmmo";
            private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
            private _ammoConfig = _cfgAmmo >> _ammo;
            private _caliber = getNumber (_ammoConfig >> "ACE_caliber");

            _caliber = switch (true) do {
                // If explicilty defined, use ACE_caliber
                case (inheritsFrom (_ammoConfig >> "ACE_caliber") isEqualTo _ammoConfig): {_caliber};
                case (_ammo isKindOf ["ShellBase", _cfgAmmo]): {80};
                case (_ammo isKindOf ["RocketBase", _cfgAmmo]): {200};
                case (_ammo isKindOf ["MissileBase", _cfgAmmo]): {600};
                case (_ammo isKindOf ["SubmunitionBase", _cfgAmmo]): {80};
                default {[_caliber, 6.5] select (_caliber <= 0)};
            };

            private _loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) / 5;
            TRACE_5("building cache",_ammo,_magazine,_initSpeed,_caliber,_loudness);

            _loudness
        }, true];
    });

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
