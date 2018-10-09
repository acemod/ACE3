#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Common", QGVAR(wipeGlasses), localize LSTRING(WipeGlasses), {
    if (GVAR(effects) != 2) exitWith {false}; //Can only wipe if full effects setting is set
    if (!GETVAR(ace_player,ACE_isUnconscious,false)) exitWith {
        call FUNC(clearGlasses);
        true
    };
    false
},
{false},
[20, [true, true, false]], false] call CBA_fnc_addKeybind;


["ace_settingsInitialized", {
    TRACE_2("ace_settingsInitialized eh",GVAR(effects),GVAR(showInThirdPerson));

    if (GVAR(effects) == 0) exitWith {};

    // ---Add the TINT Effect---

    // make sure to stack effect layers in correct order
    GVAR(GogglesEffectsLayer) = QGVAR(GogglesEffectsLayer) call BIS_fnc_RSCLayer;
    GVAR(GogglesLayer) = QGVAR(GogglesLayer) call BIS_fnc_RSCLayer;

    if (isNil QGVAR(UsePP)) then {
        GVAR(UsePP) = true;
    };

    // init pp effects
    GVAR(PostProcess) = ppEffectCreate ["ColorCorrections", 1995];
    GVAR(EffectsActive) = false;

    // add glasses eventhandlers
    ["ace_glassesChanged", {
        params ["_unit", "_glasses"];
        TRACE_2("ace_glassesChanged eh",_unit,_glasses);

        SETGLASSES(_unit,GLASSESDEFAULT);

        if (call FUNC(ExternalCamera)) exitWith {call FUNC(RemoveGlassesEffect)};

        if ([_unit] call FUNC(isGogglesVisible)) then {
            [_unit, _glasses] call FUNC(applyGlassesEffect);
        } else {
            call FUNC(removeGlassesEffect);
        };
    }] call CBA_fnc_addEventHandler;

    // init GlassesChanged eventhandler
    GVAR(OldGlasses) = "<null>";
    ["loadout", {
        params ["_unit"];

        private _currentGlasses = goggles _unit;

        if (GVAR(OldGlasses) != _currentGlasses) then {
            ["ace_glassesChanged", [_unit, _currentGlasses]] call CBA_fnc_localEvent;
            GVAR(OldGlasses) = _currentGlasses;
        };
    }, true] call CBA_fnc_addPlayerEventHandler;



    // check goggles
    private _fnc_checkGoggles = {
        params ["_unit"];

        if (GVAR(EffectsActive)) then {
            if (call FUNC(externalCamera) || {!([_unit] call FUNC(isGogglesVisible))}) then {
                call FUNC(removeGlassesEffect);
            };
        } else {
            if (!(call FUNC(externalCamera)) && {[_unit] call FUNC(isGogglesVisible)}) then {
                [_unit, goggles _unit] call FUNC(applyGlassesEffect);
            };
        };
    };

    ["cameraView", _fnc_checkGoggles] call CBA_fnc_addPlayerEventHandler;
    ["ace_activeCameraChanged", _fnc_checkGoggles] call CBA_fnc_addEventHandler;



    // // ---Add the Dust/Dirt/Rain Effects---
    if (GVAR(effects) == 2) then {

        // Register fire event handler
        ["ace_firedPlayer", DFUNC(handleFired)] call CBA_fnc_addEventHandler;

        //Add Explosion XEH
        ["CAManBase", "explosion", FUNC(handleExplosion)] call CBA_fnc_addClassEventHandler;

        GVAR(PostProcessEyes) = ppEffectCreate ["ColorCorrections", 1992];
        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [1, 1, 1, 0]];
        GVAR(PostProcessEyes) ppEffectCommit 0;
        GVAR(PostProcessEyes) ppEffectEnable false;
        GVAR(PostProcessEyes_Enabled) = false;

        GVAR(FrameEvent) = [false, [false, 20]];
        GVAR(DustHandler) = -1;
        GVAR(RainDrops) = objNull;
        GVAR(RainActive) = false;
        GVAR(RainLastLevel) = 0;
        GVAR(surfaceCache) = "";
        GVAR(surfaceCacheIsDust) = false;

        ["ace_glassesCracked", {
            params ["_unit"];

            _unit setVariable ["ACE_EyesDamaged", true];

            GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0]];
            GVAR(PostProcessEyes) ppEffectCommit 0;
            GVAR(PostProcessEyes) ppEffectEnable true;

            [{
                GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
                GVAR(PostProcessEyes) ppEffectCommit 5;

                [{
                    params ["_unit"];

                    GVAR(PostProcessEyes) ppEffectEnable false;

                    _unit setVariable ["ACE_EyesDamaged", false];

                }, _this, 5] call CBA_fnc_waitAndExecute;

            }, _unit, 25] call CBA_fnc_waitAndExecute;

        }] call CBA_fnc_addEventHandler;

        // goggles effects main PFH
        [{
            BEGIN_COUNTER(goggles);

            // rain
            call FUNC(applyRainEffect);

            // auto remove effects under water
            if (GVAR(EffectsActive) && {underwater ACE_player} && {[goggles ACE_player] call FUNC(isDivingGoggles)}) then {
                call FUNC(removeRainEffect);
                call FUNC(removeDirtEffect);
                call FUNC(removeDustEffect);
            };

            // rotor wash effect
            call FUNC(applyRotorWashEffect);

            END_COUNTER(goggles);
        }, 0.5, []] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
