/*
 * Author: Garth 'L-H' de Wet
 * Applies dust to screen.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_applyDustEffect
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (call FUNC(ExternalCamera)) exitWith {};

private ["_unit", "_amount"];

_unit = ACE_player;

if ([_unit] call FUNC(isGogglesVisible)) exitWith {
    GVAR(GogglesEffectsLayer) cutRsc ["RscACE_GogglesEffects", "PLAIN", 2, false];

    ((GETUVAR(GVAR(DisplayEffects),displayNull)) displayCtrl 10662) ctrlSetText format [getText (configFile >> "CfgGlasses" >> goggles _unit >> "ACE_DustPath"), GETDUSTT(DAMOUNT) + 1];

    private _effectBrightness = linearConversion [0,1,([] call EFUNC(common,ambientBrightness)),0.25,1];
    ((GETUVAR(GVAR(DisplayEffects),displayNull)) displayCtrl 10662) ctrlSetTextColor [_effectBrightness, _effectBrightness, _effectBrightness, 1];
    TRACE_1("dust",_effectBrightness);

    SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT) + 1,0,1));
    SETDUST(DBULLETS,0);
};

if (GETVAR(_unit,ACE_EyesDamaged,false)) exitWith {
    SETDUST(DACTIVE,false);
    SETDUST(DBULLETS,0);
    SETDUST(DAMOUNT,0);
};

SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT) + 1,0,2));

_amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);

GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [_amount, _amount, _amount, _amount], [1, 1, 1, 0]];
GVAR(PostProcessEyes) ppEffectCommit 1;
GVAR(PostProcessEyes) ppEffectEnable true;

SETDUST(DBULLETS,0);

[GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
GVAR(DustHandler) = -1;

GVAR(DustHandler) = [{
    if (diag_tickTime >= GETDUSTT(DTIME) + 3) then {
        SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));

        private _amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);

        if !(_unit getVariable ["ACE_EyesDamaged", false]) then {
            GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [_amount, _amount, _amount, _amount], [1, 1, 1, 0]];
            GVAR(PostProcessEyes) ppEffectCommit 0.5;
        };

        if (GETDUSTT(DAMOUNT) <= 0) then {
            SETDUST(DACTIVE,false);
            SETDUST(DBULLETS,0);

            GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];
            GVAR(PostProcessEyes) ppEffectCommit 2;

            [{
                if (GVAR(DustHandler) == -1) then {
                    GVAR(PostProcessEyes) ppEffectEnable false
                };
            }, [], 2] call CBA_fnc_waitAndExecute;

            [GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
            GVAR(DustHandler) = -1;
        };
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
