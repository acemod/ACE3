#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(shownIDC) = -1;
GVAR(eachFrame) = -1;
GVAR(mapCenter) = [0.5, 0.5];

GVAR(allMaps) = createHashMap; // hash of idc/itemRequired
private _mapCfgs = "true" configClasses (configFile >> "RscDisplayMainMap" >> "controlsBackground");
{
    private _item = getText (_x >> QGVAR(mapItem));
    if (_item == "") then { continue; };
    _item = _item call EFUNC(common,getConfigName);
    private _idc = getNumber (_x >> "idc");
    GVAR(allMaps) set [_idc, _item];
} forEach _mapCfgs;


[{
    !isNull findDisplay 12
}, {
    ["visibleMap", {
        params ["", "_visibleMap"];
        TRACE_3("visibleMap",_visibleMap,GVAR(shownIDC),GVAR(eachFrame));

        if (_visibleMap) then {
            if (GVAR(eachFrame) == -1) then {
                [0] call FUNC(selectMap);
                GVAR(eachFrame) = addMissionEventHandler ["EachFrame", LINKFUNC(eachFrame)];
            };
        } else {
            if (GVAR(eachFrame) != -1) then {
                removeMissionEventHandler ["EachFrame", GVAR(eachFrame)];
                GVAR(eachFrame) = -1;
            };
        };
    }, true] call CBA_fnc_addPlayerEventhandler;
}, []] call CBA_fnc_waitUntilAndExecute;
