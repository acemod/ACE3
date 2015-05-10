#include "script_component.hpp"
PARAMS_1(_vehicle);
private["_id"];

if(!GVAR(Enabled)) exitWith {};

_id = _vehicle getVariable[QGVAR(id), -1];
if(_id > 0) then {
    _id = _vehicle setVariable[QGVAR(id), -1];
    format["delete_vehicle:%1",_id] call FUNC(callExtension);
};