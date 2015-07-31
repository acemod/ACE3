/*
 * Author: SilentSpike
 * Overrides the unit being used for the goggles overlay.
 * To reset back to default behaviour, use objNull.
 *
 * Arguments:
 * 0: New unit to use for goggles overlay <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newUnit",objNull,[objNull]]];

private "_oldUnit";
_oldUnit = GETUNIT;

// No change, no service
if (_newUnit == _oldUnit) exitWith {};

GVAR(unit) = _newUnit;
_newUnit = GETUNIT;

// If disabled, no need to update anything more
if (GVAR(showGoggles) == 0) exitWith {};

[] call DFUNC(checkGlasses);

// EHs not necessary for non men (considered to mean no goggles)
if !(_newUnit isKindOf "CAManBase") exitWith {};

// Add event handlers to produce goggle effects if they don't already exist
if !(GETVAR(_newUnit,GVAR(effects),false)) then {
    _newUnit addEventHandler ["Explosion", {
        params ["_unit","_damage"];
        private ["_effects"];

        // Don't apply effects if not the current unit
        if ((GVAR(showGoggles) == 0) || {_unit != GETUNIT}) exitWith {};

        if (alive _unit) then {
            [] call FUNC(applyDirtEffect);
            if (GETBROKEN(_unit)) exitWith {};
            if (([_damage] call FUNC(getExplosionIndex)) < getNumber (ConfigFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_Resistance")) exitWith {};
            if !([_unit] call FUNC(isGogglesVisible)) exitWith {["GlassesCracked",[_unit]] call EFUNC(common,localEvent);};
            _effects = GETGLASSES(_unit);
            _effects set [BROKEN, true];
            SETGLASSES(_unit,_effects);
            if (getText (ConfigFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_OverlayCracked") != "" && {cameraOn == _unit}) then {
                if (call FUNC(ExternalCamera)) exitWith {};
                if (isNull(GLASSDISPLAY)) then {
                    150 cutRsc ["RscACE_Goggles", "PLAIN", 1, false];
                };
                (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText (ConfigFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_OverlayCracked");
            };
            ["GlassesCracked",[_unit]] call EFUNC(common,localEvent);
        };
    }];

    _newUnit addEventHandler ["Fired", FUNC(handleFired)];

    SETVAR(_newUnit,GVAR(effects),true);
};

if (_newUnit != player) exitWith {};

// Add killed EH if it doesn't already exist
if !(GETVAR(_newUnit,GVAR(handled),false)) then {
    _newUnit addEventHandler ["Killed",{
        params ["_unit","_killer"];

        // End and reset all goggle effects on player death
        if (_unit == GETUNIT) then {
            GVAR(postProcessEyes) ppEffectEnable false;

            SETGLASSES(_unit,GLASSESDEFAULT);
            GVAR(EffectsActive) = false;
            [] call FUNC(removeGlassesEffect);

            _unit setVariable ["ACE_EyesDamaged", false];

            if ((GETVAR(_unit,GVAR(dustHandler),-1)) != -1) then {
                [GETVAR(_unit,GVAR(dustHandler),-1)] call CBA_fnc_removePerFrameHandler;
                SETVAR(_unit,GVAR(dustHandler),-1);
            };
        };
    }];

    SETVAR(_newUnit,GVAR(handled),true);
};
