#include "script_component.hpp"

PARAMS_2(_unit,_target);

closeDialog 0;
createDialog QGVAR(sharedMapDialog);
_unit getVariable [QGVAR(sharingMapObject), _target, true];

[{
    EXPLODE_2_PVT(_this,_params,_pfhId);
    EXPLODE_2_PVT(_params,_unit,_target);

    if ((ACE_player != _unit) ||
            {!([_unit, _target] call FUNC(canOpenSharedMap))} ||
            {(isNull (uiNamespace setVariable ['PABST_ShareMapDialog', _this select 0]))}) exitWith {
            
        _unit getVariable [QGVAR(sharingMapObject), objNull, true];
        //If dialog still open, close it
        if (!isNull (uiNamespace setVariable ['PABST_ShareMapDialog', _this select 0])) then {
            closeDialog 0;
        };
        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };
    
    //do stuff
    
}, 0, [_unit, _target]] call CBA_fnc_addPerFrameHandler;
