#include "script_component.hpp"

PREP(lockKeyDown);
PREP(lockKeyUp);

PREP(cycleFireMode);
PREP(showFireMode);

PREP(onFired);
PREP(onOpticLoad);
PREP(onOpticDraw);
PREP(onOpticUnload);

GVAR(isLockKeyDown) = false;
GVAR(pfehID) = -1;


FUNC(disableFire) = {
    param ["_firedEH", "_target"];
    if(_firedEH < 0 && difficulty > 0) then {
        _firedEH = [ACE_player, "DefaultAction", {true}, {
            _canFire = _target getVariable["ace_missileguidance_target", nil];
            if(!isNil "_canFire") exitWith { false };
            true
        }] call EFUNC(common,addActionEventHandler);
    };
    _firedEH
};

FUNC(enableFire) = {
    params ["_firedEH"];

    if(_firedEH > 0 && difficulty > 0) then {
        [ACE_player, "DefaultAction", _firedEH] call EFUNC(common,removeActionEventHandler);
    };
    -1
};
