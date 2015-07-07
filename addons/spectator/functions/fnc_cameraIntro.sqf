/*
    Author:
    voiper

    Description:
    Curtain, sound, and text intro when camera starts.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_camIntro;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

999999 cutText ["", "BLACK IN", 2];
2 fadeSound 1;

["Press H for spectator controls", 2] call EFUNC(common,displaytextstructured);

[_this select 1] call CBA_fnc_removePerFrameHandler;