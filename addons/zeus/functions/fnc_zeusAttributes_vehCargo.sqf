#include "script_component.hpp"

params ["_control"];
TRACE_1("params",_control);

private _veh = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objnull];
TRACE_1("",_veh);

private _loaded = _veh getVariable [QEGVAR(cargo,loaded), []];
TRACE_1("",_loaded);

{
    ((ctrlParent _control) displayCtrl 80086) lbAdd (str _x);
} forEach _loaded;
