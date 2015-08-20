#include "script_component.hpp"
if !(hasInterface) exitWith {};

// Initalize PP variables
GVAR(postProcess) = ppEffectCreate ["ColorCorrections", 1995];
GVAR(postProcessEyes) = ppEffectCreate ["ColorCorrections", 1992];
GVAR(postProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
GVAR(postProcessEyes) ppEffectCommit 0;
GVAR(postProcessEyes) ppEffectEnable false;

// Initalize tracking variables
GVAR(effectsActive) = false;
GVAR(frameEvent) = [false, [false,20]];
GVAR(goggles) = "";
GVAR(postProcessEyes_Enabled) = false;
GVAR(rainActive) = false;
GVAR(rainDrops) = objNull;
GVAR(rainLastLevel) = 0;
GVAR(surfaceCache) = "";
GVAR(surfaceCacheIsDust) = false;
GVAR(unit) = objNull;

if (isNil QGVAR(UsePP)) then {
    GVAR(UsePP) = true;
};

["ACE3 Common", QGVAR(wipeGlasses), localize LSTRING(WipeGlasses),
{
    // Can only wipe when unit isn't overridden
    if ((isNull GVAR(unit)) && !(GETVAR(ACE_Player,ACE_isUnconscious,false))) exitWith {
        [ACE_Player] call FUNC(clearGlasses);
        true
    };
    false
},
{false},
[20, [true, true, false]], false] call cba_fnc_addKeybind;

// Function to check glasses and trigger event when they change
DFUNC(checkGlasses) = {
    private ["_unit","_goggles"];
    _unit = GETUNIT;
    _goggles = goggles _unit;

    if (GVAR(goggles) != _goggles) then {
        ["GlassesChanged", [_goggles]] call EFUNC(common,localEvent);
    };
};

["GlassesChanged",{
    _unit = GETUNIT;
    GVAR(goggles) = _this select 0;
    SETGLASSES(_unit,GLASSESDEFAULT);

    if (!([] call FUNC(ExternalCamera)) && {[_unit] call FUNC(isGogglesVisible)}) then {
        [] call FUNC(applyGlassesEffect);
    } else {
        [] call FUNC(removeGlassesEffect);
    };
}] call EFUNC(common,addEventHandler);

["GlassesCracked",{
    _unit = GETUNIT;

    _unit setVariable ["ACE_EyesDamaged", true];
    GVAR(postProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0.5,0.5,0.5,0.5],[1,1,1,0]];
    GVAR(postProcessEyes) ppEffectCommit 0;
    GVAR(postProcessEyes) ppEffectEnable true;
    [{
        params ["_unit"];
        if (_unit == GETUNIT) then {
            GVAR(postProcessEyes) ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
            GVAR(postProcessEyes) ppEffectCommit 5;
        };

        [{
            params ["_unit"];

            if (_unit == GETUNIT) then {
                GVAR(postProcessEyes) ppEffectEnable false;
            }:
            _unit setVariable ["ACE_EyesDamaged", false];
        }, _this, 5] call EFUNC(common,waitAndExecute);
    }, [_unit], 25] call EFUNC(common,waitAndExecute);
}] call EFUNC(common,addEventHandler);

// Handles adding EHs to player unit at mission start (and on remote control)
["playerChanged", {
    [] call FUNC(changeUnit);
}] call EFUNC(common,addEventHandler);

// Only need PFHs if overlay enabled
["SettingsInitialized", {
    if (GVAR(showGoggles) != 0) then {
        GVAR(effectsPFH) = [FUNC(checkGoggles), 1, []] call CBA_fnc_addPerFrameHandler;
        GVAR(rainPFH) = [FUNC(rainEffect), 0.5, []] call CBA_fnc_addPerFrameHandler;
        GVAR(downwashPFH) = [FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;
    };
}] call EFUNC(common,addEventHandler);

// Update glasses overlay on settings change
["SettingChanged", {
    params ["_name","_value"];

    if (_name == QGVAR(showGoggles)) then {
        // Enable/disable PFHs as needed
        if (_value == 0) then {
            if !(isNil QGVAR(effectsPFH)) then {
                [GVAR(effectsPFH)] call CBA_fnc_removePerFrameHandler;
                [GVAR(rainPFH)] call CBA_fnc_removePerFrameHandler;
                [GVAR(downwashPFH)] call CBA_fnc_removePerFrameHandler;
            };
            GVAR(effectsPFH) = nil;
            GVAR(rainPFH) = nil;
            GVAR(downwashPFH) = nil;

            // Remove any currently active effects
            GVAR(postProcessEyes) ppEffectEnable false;
            [] call FUNC(removeDustEffect);
            [] call FUNC(removeDustEffect);
            [] call FUNC(removeGlassesEffect);
            [] call FUNC(removeRainEffect);
        } else {
            if (isNil QGVAR(effectsPFH)) then {
                GVAR(effectsPFH) = [FUNC(checkGoggles), 1, []] call CBA_fnc_addPerFrameHandler;
                GVAR(rainPFH) = [FUNC(rainEffect), 0.5, []] call CBA_fnc_addPerFrameHandler;
                GVAR(downwashPFH) = [FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;
            };
        };

        // Update the unit and overlay
        [] call FUNC(changeUnit);
    };
}] call EFUNC(common,addEventHandler);
