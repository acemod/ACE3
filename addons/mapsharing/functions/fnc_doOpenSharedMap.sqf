#include "script_component.hpp"

PARAMS_2(_unit,_target);

if (ACE_player != _unit) exitWith {};

_unit setVariable [QGVAR(sharingMapHost), _target, true];
GVAR(MapMouseWorldPos) = [];
GVAR(MapLeftMouseButtonIsDown) = false;

closeDialog 0;
createDialog QGVAR(sharedMapDialog);
systemChat "Debug: Starting Sharing";

[{
    EXPLODE_2_PVT(_this,_params,_pfhId);
    EXPLODE_2_PVT(_params,_unit,_target);

    if ((ACE_player != _unit) ||
            {!([_unit, _target] call FUNC(canOpenSharedMap))} ||
            {(isNull (uiNamespace getVariable ['PABST_ShareMapDialog', displayNull]))}) exitWith {

        systemChat "Debug: Ending Sharing";

        _unit setVariable [QGVAR(sharingMapHost), objNull, true];
        //If dialog still open, close it
        if (!isNull (uiNamespace getVariable ['PABST_ShareMapDialog', displayNull])) then {
            closeDialog 0;
        };
        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };

    //Sync our map with the host:
    _mapSettings = _target getVariable [QGVAR(sharingMapPosition), [1,[0,0,0]]]; //hmm, this won't be set the first few frames?
    _ctrl = (uiNamespace getVariable ['PABST_ShareMapDialog', displayNull]) displayCtrl 80085;

    // systemChat format ["%1", [0, (_mapSettings select 0), (_mapSettings select 1)]];

    _ctrl ctrlMapAnimAdd [0, (_mapSettings select 0), (_mapSettings select 1)];
    ctrlMapAnimCommit _ctrl;

}, 0, [_unit, _target]] call CBA_fnc_addPerFrameHandler;
