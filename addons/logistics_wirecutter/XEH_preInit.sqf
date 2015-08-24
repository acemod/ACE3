#include "script_component.hpp"

ADDON = false;

PREP(cutDownFence);
PREP(interactEH);
PREP(isFence);

ADDON = true;


// Condition for Interaction
DFUNC(Condition) = {
    params ["_dummyTarget", "_player", "_attachedFence"];
    ((!isNull _attachedFence) && {(damage _attachedFence) < 1} && {("ACE_wirecutter" in (items _player))})
};

// Statement for Interaction
DFUNC(Statement) = {
    params ["_dummyTarget", "_player", "_attachedFence"];
    [_player, _attachedFence] call FUNC(cutDownFence);
};

// ProgressCheck for Cut Down Fence
DFUNC(progressCheck) = {
    params ["_args", "_passedTime"];
    _args params ["_fenceObject", "_lastSoundEffectTime"];

    if (_passedTime > (_lastSoundEffectTime + SOUND_CLIP_TIME_SPACEING)) then {
        // playSound "ACE_wirecutter_sound";
        playSound3D [QUOTE(PATHTO_R(sound\wirecut.ogg)), objNull, false, (getPosASL ACE_player), 3, 1, 10];
        _args set [1, _passedTime];
    };
    ((!isNull _fenceObject) && {(damage _fenceObject) < 1} && {("ACE_wirecutter" in (items ACE_player))})
};
