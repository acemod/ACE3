#include "script_component.hpp"

if (GVAR(enabled)) then {
    if (!isNil QGVAR(toggleEHIds)) exitWith {};

    private _ehIds = [];
    _ehIds pushBack (["ace_firedPlayer", DFUNC(fired)] call CBA_fnc_addEventHandler);
    _ehIds pushBack (["ace_firedPlayerNonLocal", DFUNC(fired)] call CBA_fnc_addEventHandler);
    _ehIds pushBack (["ace_firedNonPlayer", DFUNC(fired)] call CBA_fnc_addEventHandler);
    _ehIds pushBack (["ace_firedPlayerVehicle", DFUNC(fired)] call CBA_fnc_addEventHandler);
    _ehIds pushBack (["ace_firedPlayerVehicleNonLocal", DFUNC(fired)] call CBA_fnc_addEventHandler);
    _ehIds pushBack (["ace_firedNonPlayerVehicle", DFUNC(fired)] call CBA_fnc_addEventHandler);

    private _pfhIds = [];
    _pfhIds pushBack ([FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler);

    GVAR(toggleEHIds) = [_ehIds, _pfhIds];
} else {
    if (isNil QGVAR(toggleEHIds)) exitWith {};

    GVAR(toggleEHIds) params ["_ehIds", "_pfhIds"];

    ["ace_firedPlayer", _ehIds select 0] call CBA_fnc_removeEventHandler;
    ["ace_firedPlayerNonLocal", _ehIds select 1] call CBA_fnc_removeEventHandler;
    ["ace_firedNonPlayer", _ehIds select 2] call CBA_fnc_removeEventHandler;
    ["ace_firedPlayerVehicle", _ehIds select 3] call CBA_fnc_removeEventHandler;
    ["ace_firedPlayerVehicleNonLocal", _ehIds select 4] call CBA_fnc_removeEventHandler;
    ["ace_firedNonPlayerVehicle", _ehIds select 5] call CBA_fnc_removeEventHandler;

    {
        _x call CBA_fnc_removePerFrameHandler;
    } forEach _pfhIds;

    GVAR(toggleEHIds) = nil;
};
