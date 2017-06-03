// TODO: Header
#include "script_component.hpp"

{
    private _pylon = (_x select 0) lbData (lbCurSel (_x select 0));
    private _count = [configFile >> "CfgMagazines" >> _pylon >> "count", "number", 0] call CBA_fnc_getConfigEntry;

    GVAR(currentAircraft) setPylonLoadout [_forEachIndex + 1, _pylon, true];
    GVAR(currentAircraft) setAmmoOnPylon [_forEachIndex + 1, _count];
} forEach GVAR(comboBoxes);
