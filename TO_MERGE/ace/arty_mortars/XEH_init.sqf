//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_gun);

if (_gun isKindOf "ACE_120Tampella_Barrel" || {_gun isKindOf "ACE_120Tampella_Baseplate"}) exitWith {}; // TODO: Include in XEH ?? How?

#define ACE_TEXT_SILVER(Text) ("<t color='#C0C0C0'>" + ##Text + "</t>")

_dn = getText(configFile >> "CfgVehicles" >> typeOf _gun >> "displayName");
_actionTextL = format[localize "STR_ACE_ARTY_SHIFT_MORTAR_LEFT",_dn];
_actionTextR = format[localize "STR_ACE_ARTY_SHIFT_MORTAR_RIGHT",_dn];

// Check if we have already presets...
_azimCount = _gun getVariable [QGVAR(azimuthCounter), 0];
_gun setVariable [QGVAR(azimuthCounter), _azimCount];

_defCount = _gun getVariable [QGVAR(deflectionCounter), 3200];
_gun setVariable [QGVAR(deflectionCounter), _defCount];

_elevCount = _gun getVariable [QGVAR(elevationCounter), 1100];
_gun setVariable [QGVAR(elevationCounter), _elevCount];

_resCount = _gun getVariable [QGVAR(resetCounter), 3200];
_gun setVariable [QGVAR(resetCounter), _resCount];

_resPhase = _gun getVariable [QGVAR(resetPhase), 0];
_gun setVariable [QGVAR(resetPhase), _resPhase];

_curRound = _gun getVariable ["ace_sys_arty_currentRound", []];
_gun setVariable ["ace_sys_arty_currentRound", _curRound];

_roundData = _gun getVariable ["ace_sys_arty_roundData", []];
_gun setVariable ["ace_sys_arty_roundData", _roundData];

_gun call FUNC(alignGun);

_shiftLeftActionId = _gun addAction [ACE_TEXT_SILVER(_actionTextL), QPATHTO_F(fnc_shiftLeft), [], 2000, false, true, "", "(vehicle player == player) && {!(player in _target)} && {!locked _target} && {alive _target} && {(player distance _target < 1.5)} && {!(player getVariable [""ace_sys_cargo_carrying"",false])}"];
_shiftRightActionId = _gun addAction [ACE_TEXT_SILVER(_actionTextR), QPATHTO_F(fnc_shiftRight), [], 2000, false, true, "", "(vehicle player == player) && {!(player in _target)} && {!locked _target} && {alive _target} && {(player distance _target < 1.5)} && {!(player getVariable [""ace_sys_cargo_carrying"",false])}"];

// Call global Event to create a monitoring trigger on the server
[QGVAR(trigger_mon), [_gun]] call CBA_fnc_globalEvent; // ACE_SYS_ARTY_MORTARS
