/*
 * Author: commy2
 * Taps a shoulder
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 * 2: Shoulder which was tapped <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [player, target] call ace_interaction_fnc_tapShoulder
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_tapper,_target,_shoulderNum);

if (_target != ACE_player) exitWith {
    addCamShake [4, 0.5, 5];
    ACE_player playActionNow "PutDown";
    if !(local _target) then {
        [[_tapper, _target, _shoulderNum], QUOTE(DFUNC(tapShoulder)), _target] call EFUNC(common,execRemoteFnc);
    };
};

addCamShake [4, 0.5, 5];

private ["_message"];
//localize is converting the escaped <> symbols, so just add them here instead of in the stringtable
if (_shoulderNum == 0) then {
    _message = format ["%1 &gt;", (localize "STR_ACE_Interaction_YouWereTappedRight")];
} else {
    _message = format ["&lt; %1", (localize "STR_ACE_Interaction_YouWereTappedLeft")];
};

[parseText _message] call EFUNC(common,displayTextStructured);
