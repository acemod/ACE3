#include "script_component.hpp"

PARAMS_1(_theMap);

// systemChat ["x"];

//Only show when sharing map
_sharedHost = ACE_player getVariable [QGVAR(sharingMapHost), objNull];
if (isNull _sharedHost) exitWith {};

_nearUnits = if ((vehicle ACE_player) == ACE_player) then {
    ACE_player nearEntities ["CAManBase", 5];
} else {
    crew (vehicle ACE_player);
};

_unitsUsingSameMap = [_nearUnits, {_sharedHost == (_this getVariable [QGVAR(sharingMapHost), objNull])}] call EFUNC(common,filter);

{
    _clickPos = _x getVariable [QGVAR(mouseClickPos), []];
    systemChat format ["%1 = %2", (name _x), _clickPos];
    if (!(_clickPos isEqualTo [])) then {
        _name = [_x] call EFUNC(common,getName);
        _theMap drawIcon ["iconThing", [1,0,0,1], _clickPos, 4, 4, 0, _name, 0, 0.03, "TahomaB", "center"];
    };
} forEach _unitsUsingSameMap;
