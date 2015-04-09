// by commy2
#include "script_component.hpp"

private ["_unit", "_firer", "_damage"];

_unit = _this select 0;
_firer = _this select 1;
_damage = _this select 2;

// don't fall on collision damage
if (_unit == _firer) exitWith {};

// cam shake for player
if (_unit == ACE_player) then {
    addCamShake [3, 5, _damage + random 10];
};

private "_vehicle";
_vehicle = vehicle _unit;

// handle static weapons
if (_vehicle isKindOf "StaticWeapon") exitwith {
    if (!alive _unit) then {
        _unit action ["Eject", _vehicle];
        unassignVehicle _unit;
    };
};

// don't fall after minor damage
if (_damage < 0.1) exitWith {};

// play sound
if (!isNil QUOTE(EFUNC(medical,playInjuredSound))) then {
    [_unit] call EFUNC(medical,playInjuredSound);
};

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
private ["_isPlayer", "_isRunning", "_anim"];

_isPlayer = [_unit] call EFUNC(common,isPlayer);
_isRunning = _velocity > 4;

_anim = switch (currentWeapon _unit) do {
    case (""): {"AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"};
    case (primaryWeapon _unit): {
        if !(_isPlayer) exitWith {"AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"};

        [
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft",
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
        ] select floor random 4;
    };
    case (handgunWeapon _unit): {
        if !(_isPlayer) exitWith {"AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon"};

        [
            "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
            "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
            "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft",
            "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright"
        ] select floor random 4;
    };
    default {""};
};

// exit if no animation for this weapon exists, i.E. binocular or rocket launcher
if (_anim == "") exitWith {};

// don't mess with transitions. don't fall then.
if ([_unit] call EFUNC(common,inTransitionAnim)) exitWith {};

[_unit, _anim, 2] call EFUNC(common,doAnimation);
