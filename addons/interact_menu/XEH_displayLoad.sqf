#include "script_component.hpp"

disableSerialization;

params ["_display"];

if (ctrlIDD _display == 12) then { // RscDisplayMainMap
    (_display displayCtrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(render)}];
};
