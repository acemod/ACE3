#include "script_component.hpp"

PARAMS_1(_unit);

_unit setVariable [QGVAR(sharingMapHost), _unit, true];

[{
    EXPLODE_2_PVT(_this,_params,_pfhId);
    EXPLODE_4_PVT(_params,_unit,_target,_syncedUnits,_syncedMarkers);

    if ((ACE_player != _unit) || {!([_unit, _target] call FUNC(canShareMap))}) exitWith {
        _unit setVariable [QGVAR(sharingMapHost), objNull, true];
        [_pfhId] call CBA_fnc_removePerFrameHandler;
        systemChat "Debug: Ending Sharing";
    };

    _nearUnits = if ((vehicle ACE_player) == ACE_player) then {
        ACE_player nearEntities ["CAManBase", 5];
    } else {
        crew (vehicle ACE_player);
    };
    _clientUnits = [_nearUnits, {(_this != ACE_player) && {ACE_player == (_this getVariable [QGVAR(sharingMapHost), objNull])}}] call EFUNC(common,filter);
    _currentMarkers = [] call FUNC(serializeLocalMarkers);

    
    if ((!(_clientUnits isEqualTo _syncedUnits)) || {!(_currentMarkers isEqualTo _syncedMarkers)}) then {
        if ((count _clientUnits) > 0) then {
             systemChat format ["Sending %2 markers to  %1", _clientUnits, (count _currentMarkers)];
            ["ShareMap_RecieveMarkers", _clientUnits, [_unit, _currentMarkers]] call EFUNC(common,targetEvent);
        };
        _params set [2, _clientUnits];
        _params set [3, _currentMarkers];
    };

}, 0.5, [_unit, _target, [], []]] call CBA_fnc_addPerFrameHandler;
