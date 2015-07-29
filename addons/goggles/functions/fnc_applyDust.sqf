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
if ([] call FUNC(ExternalCamera)) exitWith {};

_unit = GETUNIT;

if ([_unit] call FUNC(isGogglesVisible)) exitWith {
    100 cutRsc ["RscACE_GogglesEffects","PLAIN",2,false];
    ((GETUVAR(GVAR(displayEffects),displayNull)) displayCtrl 10662) ctrlSetText format [getText (configFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_DustPath"), GETDUSTT(_unit,DAMOUNT)+1];
    SETDUST(_unit,DAMOUNT,CLAMP(GETDUSTT(_unit,DAMOUNT)+1,0,1));
    SETDUST(_unit,DBULLETS,0);
};

if (GETVAR(_unit,ACE_EyesDamaged,false)) exitWith {SETDUST(_unit,DACTIVE,false);SETDUST(_unit,DBULLETS,0);SETDUST(_unit,DAMOUNT,0);};
SETDUST(_unit,DAMOUNT,CLAMP(GETDUSTT(_unit,DAMOUNT)+1,0,2));

private "_amount";
_amount = 1 - (GETDUSTT(_unit,DAMOUNT) * 0.125);

GVAR(postProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
GVAR(postProcessEyes) ppEffectCommit 1;
GVAR(postProcessEyes) ppEffectEnable true;
SETDUST(_unit,DBULLETS,0);

if ((GETVAR(_unit,GVAR(dustHandler),-1)) != -1) then {
    [GETVAR(_unit,GVAR(dustHandler),-1)] call CBA_fnc_removePerFrameHandler;
    SETVAR(_unit,GVAR(dustHandler),-1);
};

_handle = [{
    (_this select 0) params ["_unit"];

    if (_unit != GETUNIT) exitWith {
        SETVAR(_unit,GVAR(dustHandler),-1);
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (ACE_diagTime >= GETDUSTT(_unit,DTIME) + 3) then {
        SETDUST(_unit,DAMOUNT,CLAMP(GETDUSTT(_unit,DAMOUNT)-1,0,2));
        private "_amount";
        _amount = 1 - (GETDUSTT(_unit,DAMOUNT) * 0.125);

        if !(_unit getVariable ["ACE_EyesDamaged", false]) then {
            GVAR(postProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
            GVAR(postProcessEyes) ppEffectCommit 0.5;
        };

        if (GETDUSTT(_unit,DAMOUNT) <= 0) then {
            GVAR(postProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
            GVAR(postProcessEyes) ppEffectCommit 2;
            [{GVAR(postProcessEyes) ppEffectEnable false;}, [], 2, 0.5] call EFUNC(common,waitAndExecute);
            SETDUST(_unit,DACTIVE,false);
            SETDUST(_unit,DBULLETS,0);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            SETVAR(_unit,GVAR(dustHandler),-1);
        };
    };
},0,[_unit]] call CBA_fnc_addPerFrameHandler;

SETVAR(_unit,GVAR(dustHandler),_handle);
