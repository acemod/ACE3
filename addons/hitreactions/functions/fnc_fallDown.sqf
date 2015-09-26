/*
 * Author: commy2
 * Adds reactions to a unit that was hit. EH only runs where to unit is local. Adds screams, falling down, falling from ladders, ejecting from static weapons and camshake for players
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: firer <OBJECT>
 * 2: damage taken <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_firer", "_damage"];

// exit if system is disabled
if (GVAR(minDamageToTrigger) == -1) exitWith {};

// don't fall after minor damage
if (_damage < GVAR(minDamageToTrigger)) exitWith {};

// don't fall on collision damage
if (_unit == _firer) exitWith {};

// camshake for player
if (_unit == ACE_player) then {
    addCamShake [3, 5, _damage + random 10];
};

// play scream sound
if (!isNil QUOTE(EFUNC(medical,playInjuredSound))) then {
    [_unit] call EFUNC(medical,playInjuredSound);
};

private "_vehicle";
_vehicle = vehicle _unit;

// handle static weapons
if (_vehicle isKindOf "StaticWeapon") exitWith {
    if (!alive _unit) then {
        _unit action ["Eject", _vehicle];
        unassignVehicle _unit;
    };
};

// don't do animations if in a vehicle (looks weird and animations never reset):
if (_vehicle != _unit) exitWith {};

// this checks most things, so it doesn't mess with being inside vehicles or while dragging etc.
if !([_unit, _vehicle] call EFUNC(common,canInteractWith)) exitWith {};

// handle ladders
if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "AGM_isLadder") == 1) exitWith {
    _unit action ["LadderOff", nearestObject [position _unit, "House"]];
};

// only play animation when standing due to lack of animations, sry
if !(stance _unit in ["CROUCH", "STAND"]) exitWith {};

private "_velocity";
_velocity = vectorMagnitude velocity _unit;

// only fall when moving
if (_velocity < 2) exitWith {};

// get correct animation by weapon
private "_anim";

call {
    private "_weapon";
    _weapon = currentWeapon _unit;

    if (_weapon == "") exitWith {
        _anim = "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"
    };

    if (_weapon == primaryWeapon _unit) exitWith {
        if ([_unit] call EFUNC(common,isPlayer)) then {
            private "_isRunning";
            _isRunning = _velocity > 4;

            _anim = [
                ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
                ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
                "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft",
                "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
            ] select floor random 4;
        } else {
            _anim = "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon";
        };
    };

    if (_weapon == handgunWeapon _unit) exitWith {
        if ([_unit] call EFUNC(common,isPlayer)) then {
            _anim = [
                "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
                "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
                "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft",
                "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright"
            ] select floor random 4;
        } else {
            _anim = "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon";
        };
    };

    _anim = "";
};

// exit if no animation for this weapon exists, i.e. binocular or rocket launcher
if (_anim == "") exitWith {};

// don't mess with transitions. don't fall then.
if !([_unit] call EFUNC(common,inTransitionAnim)) then {
    [_unit, _anim, 2] call EFUNC(common,doAnimation);
};
