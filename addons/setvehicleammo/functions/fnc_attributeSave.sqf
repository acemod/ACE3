#include "..\script_component.hpp"

params ["_control"];
TRACE_1("params",_control);

if ((lbCurSel(_control controlsGroupCtrl 100)) == 0) exitWith {
    private _return = "";
    TRACE_1("lb set to default",_return);
    _return
};


private _output = [];
{
    TRACE_1("x:",_x);
    _x params ["_xPath", "_xMag", "_xCount"];
    if (_xCount != 0) then {
        _output pushBack _x;
    };
} forEach GVAR(deltaLoad);

private _return = (str _output);
TRACE_2("",count _output,_return);
_return
