//XEH_post_init.sqf
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_gun);

#define ACE_TEXT_SILVER(Text) ("<t color='#C0C0C0'>" + ##Text + "</t>")

_dn = getText(configFile >> "CfgVehicles" >> typeOf _gun >> "displayName");
_actionTextL = format[localize "STR_ACE_ARTY_SHIFT_HOWITZER_LEFT",_dn];
_actionTextR = format[localize "STR_ACE_ARTY_SHIFT_HOWITZER_RIGHT",_dn];

_gun setVariable [QGVAR(azimuthCounter), 0];
_gun setVariable [QGVAR(deflectionCounter), 3200];
_gun setVariable [QGVAR(elevationCounter), 300];
_gun setVariable [QGVAR(resetCounter), 3200];
_gun setVariable [QGVAR(resetPhase), 0];
_gun setVariable ["ace_sys_arty_currentRound", []];
_gun setVariable ["ace_sys_arty_roundData", []];

_gun call FUNC(alignGun);

private["_shiftLeftActionId", "_shiftRightActionId"];
_shiftLeftActionId = _gun addAction [ACE_TEXT_SILVER(_actionTextL), QPATHTO_F(fnc_shiftLeft), [], 2000, false, true, "", "(vehicle player == player) && {alive _target} && {!locked _target} && {!(player in _target)} && {!(player getVariable [""ace_sys_cargo_carrying"",false])}"];
_shiftRightActionId = _gun addAction [ACE_TEXT_SILVER(_actionTextR), QPATHTO_F(fnc_shiftRight), [], 2000, false, true, "", "(vehicle player == player) && {alive _target} && {!locked _target} && {!(player in _target)} && {!(player getVariable [""ace_sys_cargo_carrying"",false])}"];
