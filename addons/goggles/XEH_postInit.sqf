#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Common", QGVAR(wipeGlasses), localize LSTRING(WipeGlasses), {
    if (!(GETVAR(ace_player,ACE_isUnconscious,false))) exitWith {
        call FUNC(clearGlasses);
        true
    };
    false
},
{false},
[20, [true, true, false]], false] call CBA_fnc_addKeybind;

// make sure to stack effect layers in correct order
QGVAR(GogglesEffectsLayer) call BIS_fnc_RSCLayer;
QGVAR(GogglesLayer) call BIS_fnc_RSCLayer;

if (isNil QGVAR(UsePP)) then {
    GVAR(UsePP) = true;
};

// init pp effects
GVAR(PostProcess) =     ppEffectCreate ["ColorCorrections", 1995];
GVAR(PostProcessEyes) = ppEffectCreate ["ColorCorrections", 1992];
GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [1, 1, 1, 0]];
GVAR(PostProcessEyes) ppEffectCommit 0;
GVAR(PostProcessEyes) ppEffectEnable false;

GVAR(EffectsActive) = false;

SETGLASSES(ace_player,GLASSESDEFAULT);

GVAR(Current) = "None";
GVAR(EyesDamageScript) = -1;
GVAR(FrameEvent) = [false, [false,20]];
GVAR(PostProcessEyes_Enabled) = false;
GVAR(DustHandler) = -1;
GVAR(RainDrops) = objNull;
GVAR(RainActive) = false;
GVAR(RainLastLevel) = 0;
GVAR(surfaceCache) = "";
GVAR(surfaceCacheIsDust) = false;


// init GlassesChanged eventhandler
GVAR(OldGlasses) = "#NULLSTRING";

["playerInventoryChanged", {
    (_this select 1) params ["", "_currentGlasses"];

    if (GVAR(OldGlasses) != _currentGlasses) then {
        ["GlassesChanged", [ACE_player, _currentGlasses]] call EFUNC(common,localEvent);
        GVAR(OldGlasses) = _currentGlasses;
    };
}] call EFUNC(common,addEventHandler);

// add glasses eventhandlers
["GlassesChanged", {
    params ["_unit", "_glasses"];

    SETGLASSES(_unit,GLASSESDEFAULT);

    if (call FUNC(ExternalCamera)) exitWith {call FUNC(RemoveGlassesEffect)};

    if ([_unit] call FUNC(isGogglesVisible)) then {
        _glasses call FUNC(applyGlassesEffect);
    } else {
        call FUNC(removeGlassesEffect);
    };
}] call EFUNC(common,addEventHandler);

["GlassesCracked", {
    params ["_unit"];

    _unit setVariable ["ACE_EyesDamaged", true];

    GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0]];
    GVAR(PostProcessEyes) ppEffectCommit 0;
    GVAR(PostProcessEyes) ppEffectEnable true;

    [{
        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
        GVAR(PostProcessEyes) ppEffectCommit 5;

        GVAR(EyesDamageScript) = [{
            params ["_unit"];

            GVAR(PostProcessEyes) ppEffectEnable false;

            _unit setVariable ["ACE_EyesDamaged", false];

        }, _this, 5] call EFUNC(common,waitAndExecute);

    }, _unit, 25] call EFUNC(common,waitAndExecute);

}] call EFUNC(common,addEventHandler);







[FUNC(CheckGoggles), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(applyRainEffect), 0.5, []] call CBA_fnc_addPerFrameHandler;
[FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;
