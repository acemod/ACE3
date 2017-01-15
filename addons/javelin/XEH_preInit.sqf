#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(isLockKeyDown) = false;
GVAR(pfehID) = -1;

DFUNC(disableFire) = {
    params ["_firedEH"];

    if (_firedEH < 0 && {difficulty > 0}) then {
        _firedEH = [ACE_player, "DefaultAction", {true}, {
            private _canFire = (_this select 1) getVariable ["ace_missileguidance_target", nil];
            if (!isNil "_canFire") exitWith { false };
            true
        }] call EFUNC(common,addActionEventHandler);
        TRACE_1("Locking Fire Button",_firedEH);

    };
    _firedEH
};
DFUNC(enableFire) = {
    params ["_firedEH"];

    if (_firedEH >= 0 && {difficulty > 0}) then {
        TRACE_1("Unlocking Fire Button",_firedEH);
        [ACE_player, "DefaultAction", _firedEH] call EFUNC(common,removeActionEventHandler);
    };
    -1
};

ADDON = true;
