#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Sets a unit in the dazed state.
 * For Internal Use: Called from the state machine.
 *
 * Arguments:
 * 0: The unit that will be put in an dazed state <OBJECT>
 * 1: Set dazed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_status_fnc_setDazedState
 *
 * Public: No
 */

params ["_unit", "_active"];
TRACE_2("setDazedState",_unit,_active);

// No change to make
if (_active isEqualTo IS_DAZED(_unit) || {!alive _unit}) exitWith { WARNING_2("no change %1-%2",_active,IS_DAZED(_unit)); };

_unit setVariable [VAR_DAZED, _active, true];

 // Dazed state only relevant to actual players
if (_unit != ACE_player) exitWith { WARNING_1("%1 not player",_unit); };

if (_active) then {
    // set dazed anim
    [_unit, QEGVAR(medical_engine,dazed_AmovPpneMstpSnonWnonDnon), 1] call EFUNC(common,doAnimation);

    // prevent players from throwing grenades (does not work)
    // [_unit, "Throw", {true}, {systemChat "block";}] call EFUNC(common,addActionEventhandler);

    [{
        params ["_args", "_pfid"];
        _args params ["_unit"];

        if ((ACE_player != _unit) || {!alive _unit} || {!IS_DAZED(_unit)}) exitWith {
            _pfid call CBA_fnc_removePerFrameHandler;
        };

        if (visibleMap) then { openMap false };
        while {dialog} do { closeDialog 0; };
        if (currentWeapon _unit != "") then {
            _unit action ["SwitchWeapon", _unit, _unit, -1];
        };
        if (stance _unit != "PRONE") then {
            WARNING_1("%1 fixing stance",animationState _unit);
            [_unit, QEGVAR(medical_engine,dazed_AmovPpneMstpSnonWnonDnon), 1] call EFUNC(common,doAnimation);
        };
    }, 0, [_unit]] call CBA_fnc_addPerFrameHandler;
} else {
    // Set anim back to normal
    [_unit, false] call EFUNC(medical_engine,setUnconsciousAnim);
};

["ace_medical_dazed", [_unit, _active]] call CBA_fnc_localEvent;
