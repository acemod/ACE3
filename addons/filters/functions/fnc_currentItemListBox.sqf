// by commy2
#include "script_component.hpp"

params ["_display"];

scopeName "main";

{
    private _control = _display displayCtrl _x;

    if (ctrlShown _control) then {
        _control breakOut "main"
    };
    false
} count [632, 640, 633, 638, 619];

-1
