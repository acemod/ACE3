/**
 * fn_setCardiacArrest.sqf
 * @Descr: Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies. <br />Timer is a random value between 120 and 720 seconds.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that will be put in cardiac arrest state)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_modifier","_timer","_counter", "_heartRate"];
_unit = _this select 0;

if (_unit getvariable [QGVAR(inCardiacArrest),false]) exitwith {};
[format["%1 is put into cardiac arrest",_unit]] call EFUNC(common,debug);
_unit setvariable [QGVAR(inCardiacArrest), true,true];
[_unit,QGVAR(heartRate), 0] call EFUNC(common,setDefinedVariable);

["Medical_onEnteredCardiacArrest", [_unit]] call ace_common_fnc_localEvent;

[_unit] call FUNC(setUnconsciousState);
_counter = 120 + round(random(600));
_timer = 0;

[{
    private ["_args","_unit","_timer","_counter","_heartRate"];
    _args = _this select 0;
    _unit = _args select 0;
    _timer = _args select 1;
    _counter = _args select 2;

    _heartRate = [_unit,QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
    if (_heartRate > 0 || !alive _unit) exitwith {
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
    if (_counter - _timer < 1) exitwith {

        [_unit] call FUNC(setDead);
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
        _unit setvariable [QGVAR(inCardiacArrest), nil,true];
    };
    _args set[1, _timer + 1];
}, 1, [_unit, _timer, _counter] ] call CBA_fnc_addPerFrameHandler;

