/*
 * Author: Garth 'L-H' de Wet
 * Sets up the glasses mod for usage. Initialises variables and event handlers.
 * Shouldn't be called by a user/modder ever. Done by the engine.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
if (!hasInterface) exitWith {};

["ACE3 Common", QGVAR(wipeGlasses), localize STRING(WipeGlasses),
{
    if (!(GETVAR(ace_player,ACE_isUnconscious,false))) exitWith {
        call FUNC(clearGlasses);
        true
    };
    false
},
{false},
[20, [true, true, false]], false] call cba_fnc_addKeybind;

if isNil(QGVAR(UsePP)) then {
    GVAR(UsePP) = true;
};

GVAR(PostProcess) = ppEffectCreate ["ColorCorrections", 1995];
GVAR(PostProcessEyes) = ppEffectCreate ["ColorCorrections", 1992];
GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
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

FUNC(CheckGlasses) = {
    if (GVAR(Current) != (goggles ace_player)) then {
        GVAR(Current) = (goggles ace_player);
        ["GlassesChanged",[GVAR(Current)]] call EFUNC(common,localEvent);
    };
};

player addEventHandler ["Explosion", {
    private "_effects";
    if (alive ace_player) then {
        call FUNC(ApplyDirtEffect);
        if (GETBROKEN) exitWith {};
        if (((_this select 1) call FUNC(GetExplosionIndex)) < getNumber(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_Resistance")) exitWith {};
        if !([ace_player] call FUNC(isGogglesVisible)) exitWith {["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);};
        _effects = GETGLASSES(ace_player);
        _effects set [BROKEN, true];
        SETGLASSES(ace_player,_effects);
        if (getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked") != "" && {cameraOn == ace_player}) then {
            if (call FUNC(ExternalCamera)) exitWith {};
            if (isNull(GLASSDISPLAY)) then {
                150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
            };
            (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked");
        };
        ["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);
    };
}];
player addEventHandler ["Killed",{
    GVAR(PostProcessEyes) ppEffectEnable false;
    SETGLASSES(ace_player,GLASSESDEFAULT);
    call FUNC(removeGlassesEffect);
    GVAR(EffectsActive)=false;
    ace_player setVariable ["ACE_EyesDamaged", false];
    if (GVAR(EyesDamageScript) != -1) then {
        [GVAR(EyesDamageScript)] call CALLSTACK(cba_fnc_removePreFrameHandler);
    };
    if (GVAR(DustHandler) != -1) then {
        [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
        GVAR(DustHandler) = -1;
    };
}];
player addEventHandler ["Fired",{[_this select 0, _this select 1] call FUNC(dustHandler);}];
player AddEventHandler ["Take",{call FUNC(checkGlasses);}];
player AddEventHandler ["Put", {call FUNC(checkGlasses);}];

["GlassesChanged",{
    SETGLASSES(ace_player,GLASSESDEFAULT);

    if (call FUNC(ExternalCamera)) exitWith {call FUNC(RemoveGlassesEffect)};

    if ([ace_player] call FUNC(isGogglesVisible)) then {
        [_this select 0] call FUNC(applyGlassesEffect);
    } else {
        call FUNC(removeGlassesEffect);
    };
}] call EFUNC(common,addEventHandler);
["GlassesCracked",{
    if (_this select 0 != ace_player) exitWith {};
    ace_player setVariable ["ACE_EyesDamaged", true];
    if (GVAR(EyesDamageScript) != -1) then {
        [GVAR(EyesDamageScript)] call CALLSTACK(cba_fnc_removePreFrameHandler);
    };
    GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0.5,0.5,0.5,0.5],[1,1,1,0]];
    GVAR(PostProcessEyes) ppEffectCommit 0;
    GVAR(PostProcessEyes) ppEffectEnable true;
    GVAR(EyesDamageScript) = [{
        GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
        GVAR(PostProcessEyes) ppEffectCommit 5;
        GVAR(EyesDamageScript) = [{
            GVAR(PostProcessEyes) ppEffectEnable false;
            ace_player setVariable ["ACE_EyesDamaged", false];
            GVAR(EyesDamageScript) = -1;
        }, [], 5, 1] call EFUNC(common,waitAndExecute);
    }, [], 25, 5] call EFUNC(common,waitAndExecute);
}] call EFUNC(common,addEventHandler);
call FUNC(checkGlasses);
[FUNC(CheckGoggles), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(rainEffect), 0.5, []] call CBA_fnc_addPerFrameHandler;
[FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;
