// by commy2
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_tapper,_target,_shoulderNum);

if (_target != ACE_player) exitWith {
    addCamShake [4, 0.5, 5];
    ACE_player playActionNow 'gestureAdvance';
    if !(local _target) then {
        [[_tapper, _target, _shoulderNum], QUOTE(DFUNC(tapShoulder)), _target] call EFUNC(common,execRemoteFnc);
    };
};

addCamShake [4, 0.5, 5];

if (_shoulderNum == 0) then {
    _message = localize "STR_ACE_Interaction_YouWereTappedRight";
} else {
    _message = localize "STR_ACE_Interaction_YouWereTappedLeft";
};

[_message] call EFUNC(common,displayTextStructured);
