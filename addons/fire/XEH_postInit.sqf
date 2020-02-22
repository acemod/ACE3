#include "script_component.hpp"

[QGVAR(burn), FUNC(burn)] call CBA_fnc_addEventHandler;
[QGVAR(playScream), {
    params ["_scream", "_source"];
    _source say3d _scream;
}] call CBA_fnc_addEventHandler;
