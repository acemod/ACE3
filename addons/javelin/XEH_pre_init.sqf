#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(isLockKeyDown) = false;
GVAR(pfehID) = -1;

DFUNC(disableFire) = {
    params ["_firedEH"];

    if(_firedEH < 0 && {difficulty > 0}) then {
        _firedEH = [ACE_player, "DefaultAction", {true}, {
            _canFire = (_this select 1) getVariable["ace_missileguidance_target", nil];
            if(!isNil "_canFire") exitWith { false };
            true
        }] call EFUNC(common,addActionEventHandler);
        TRACE_1("added",_firedEH);

    };
    _firedEH
};
DFUNC(enableFire) = {
    params ["_firedEH"];

    if(_firedEH >= 0 && {difficulty > 0}) then {
        TRACE_1("removing",_firedEH);
        [ACE_player, "DefaultAction", _firedEH] call EFUNC(common,removeActionEventHandler);
    };
    -1
};

ADDON = true;
