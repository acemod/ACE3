// by commy2
#include "script_component.hpp"

private ["_unit", "_firer", "_damage"];

_unit = _this select 0;
_firer = _this select 1;
_damage = _this select 2;

// don't fall on collision damage
if (_unit == _firer) exitWith {};

// don't fall after minor damage
if (_damage < 0.1) exitWith {};

// this checks most things, so it doesn't mess with being inside vehicles or while dragging etc.
if !([_unit, vehicle _unit] call EFUNC(common,canInteractWith)) exitWith {};

// only play animation when standing due to lack of animations, sry
if !(stance _unit in ["CROUCH", "STAND"]) exitWith {};

private "_velocity";
_velocity = vectorMagnitude velocity _unit;

// only fall when moving
if (_velocity < 2) exitWith {};

// get correct animation by weapon
private "_anim";
_anim = switch (currentWeapon _unit) do {
    case (""): {"AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"};
    case (primaryWeapon _unit): {
        [
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select (_velocity > 4),
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select (_velocity > 4),
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft",
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
        ] select floor random 4;
    };
    case (handgunWeapon _unit): {
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
