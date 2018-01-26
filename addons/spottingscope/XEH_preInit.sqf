#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["ACE_SpottingScopeObject", "killed", {
    params ["_wreck"];

    private _tube = "ACE_SpottingScope_tube" createVehicle [0,0,0];
    _tube setDir (getDir _wreck - 180);
    _tube setPosASL AGLToASL (_wreck modelToWorld (_wreck selectionPosition "destructionEffect"));
    _tube setVelocity [1 - random 2, 1 - random 2, 4];
    _tube addTorque (vectorNormalized [1 - random 2, 1 - random 2, 1 - random 2] vectorMultiply 4);
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
