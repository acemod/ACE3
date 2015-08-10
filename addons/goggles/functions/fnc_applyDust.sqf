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
 * call ace_goggles_fnc_ApplyDust;
 *
 * Public: Yes
 */
#include "script_component.hpp"
if (call FUNC(ExternalCamera)) exitWith {};
if ([ace_player] call FUNC(isGogglesVisible)) exitWith {
    100 cutRsc["RscACE_GogglesEffects", "PLAIN",2,false];
    (uiNamespace getVariable ["ACE_Goggles_DisplayEffects", displayNull] displayCtrl 10662) ctrlSetText format[getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_DustPath"), GETDUSTT(DAMOUNT)+1];
    SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,1));
    SETDUST(DBULLETS,0);
};

if (GETVAR(ace_player,ACE_EyesDamaged,false)) exitWith {SETDUST(DACTIVE,false);SETDUST(DBULLETS,0);SETDUST(DAMOUNT,0);};
SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,2));

private "_amount";
_amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);

GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
GVAR(PostProcessEyes) ppEffectCommit 1;
GVAR(PostProcessEyes) ppEffectEnable true;
SETDUST(DBULLETS,0);

if (GVAR(DustHandler) != -1) then { // should be fixed in dev CBA
    [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
    GVAR(DustHandler) = -1;
};
GVAR(DustHandler) = [{
    if (ACE_diagTime >= GETDUSTT(DTIME) + 3) then {
        SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
        private "_amount";
        _amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);
        if !(ace_player getVariable ["ACE_EyesDamaged", false]) then {
            GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
            GVAR(PostProcessEyes) ppEffectCommit 0.5;
        };
        if (GETDUSTT(DAMOUNT) <= 0) then {
            GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
            GVAR(PostProcessEyes) ppEffectCommit 2;
            [{GVAR(PostProcessEyes) ppEffectEnable false;}, [], 2, 0.5] call EFUNC(common,waitAndExecute);
            SETDUST(DACTIVE,false);
            SETDUST(DBULLETS,0);
            [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
            GVAR(DustHandler) = -1;
        };
    };
},0,[]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
