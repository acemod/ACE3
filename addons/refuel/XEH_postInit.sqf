#include "script_component.hpp"
if (!GVAR(enabled)) exitWith {};

["All", "InitPost", {
    params ["_vehicle"];
    if (getFuelCargo _vehicle <= 0) exitWith {};

    if (local _vehicle) then {
        _vehicle setFuelCargo 0;
    };
    if (-1 == _vehicle getVariable [QGVAR(HDEHID), -1]) then {
        _vehicle setVariable [QGVAR(HDEHID), _vehicle addEventHandler ["HandleDamage", LINKFUNC(handleDamage)]];
    };
}, true, ["Man"], true] call CBA_fnc_addClassEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
};

private _cacheRefuelClasses = call (uiNamespace getVariable [QGVAR(cacheRefuelClasses), {[[],[],[]]}]);
_cacheRefuelClasses params [["_staticClasses", [], [[]]], ["_baseStaticClasses", [], [[]]], ["_baseDynamicClasses", [], [[]]]];

private _cfgPositions = configFile >> QGVAR(positions) >> worldName;
if (isArray _cfgPositions) then {
    {
        _x params ["_class", "_positions"];
        {
            private _objects = _x nearObjects [_class, 30];
            if (_objects isEqualTo []) then {
                WARNING_3("no pumps %1 found near %2 %3",_class,worldName,_x);
            } else {
                {
                    // terrain fuel pumps don't trigger init and must setFuelCargo on each client
                    _x setFuelCargo 0;
                    if (isServer) then {
                        _x addEventHandler ["HandleDamage", LINKFUNC(handleDamage)];
                        _x setVariable [QGVAR(isTerrainPump), true];
                    };
                } forEach _objects;
            };
        } forEach _positions;
    } forEach getArray _cfgPositions;

    // placed in editor static objects don't trigger init but synchronize fuel cargo
    // placed in editor vehicles both trigger init and synchronize fuel cargo
    {
        if (0 < getFuelCargo _x) then {
            if (local _x) then {_x setFuelCargo 0;};
            _x setVariable [QGVAR(HDEHID), _x addEventHandler ["HandleDamage", LINKFUNC(handleDamage)]];
        };
    } forEach allMissionObjects "";
} else {
    // here are both terrain and editor static objects
    WARNING_2("World %1: no configured %2; can be loaded slower",worldName,QGVAR(positions));
    private _worldSize = worldSize;
    private _worldCenter = [_worldSize / 2, _worldSize / 2];
    private _refuelMissionObjects = allMissionObjects "" select {0 < getFuelCargo _x};
    {
        {
            _x setFuelCargo 0;
            _x addEventHandler ["HandleDamage", LINKFUNC(handleDamage)];
            if (isServer && {!(_x in _refuelMissionObjects)}) then {
                _x setVariable [QGVAR(isTerrainPump), true];
            };
        } forEach (_worldCenter nearObjects [_x, _worldSize]);
    } forEach _baseStaticClasses;
};

[QGVAR(setFuelCargo), {
    params ["_source", "_fuel"];
    TRACE_2("setFuelCargo event",_fuel,_source);
    _source setFuelCargo _fuel;
}] call CBA_fnc_addEventHandler;

[QGVAR(initSource), LINKFUNC(initSource)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

["isNotRefueling", {!((_this select 0) getVariable [QGVAR(isRefueling), false])}] call EFUNC(common,addCanInteractWithCondition);

["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;

GVAR(mainAction) = [
    QGVAR(Refuel),
    localize LSTRING(Refuel),
    QPATHTOF(ui\icon_refuel_interact.paa),
    {},
    {
        alive _target
        && {[_player, _target, [INTERACT_EXCEPTIONS]] call EFUNC(common,canInteractWith)}
        && {REFUEL_DISABLED_FUEL != [_target] call FUNC(getFuel)}
    },
    {}, [], [0,0,0],
    REFUEL_ACTION_DISTANCE
] call EFUNC(interact_menu,createAction);

GVAR(actions) = [
    [QGVAR(TakeNozzle),
        localize LSTRING(TakeNozzle),
        QPATHTOF(ui\icon_refuel_interact.paa),
        {[_player, _target] call FUNC(TakeNozzle)},
        {[_player, _target] call FUNC(canTakeNozzle)},
        {}, [], [0,0,0],
        REFUEL_ACTION_DISTANCE
    ] call EFUNC(interact_menu,createAction),
    [QGVAR(CheckFuelCounter),
        localize LSTRING(CheckFuelCounter),
        QPATHTOF(ui\icon_refuel_interact.paa),
        {[_player, _target] call FUNC(readFuelCounter)},
        {true},
        {}, [], [0,0,0],
        REFUEL_ACTION_DISTANCE
    ] call EFUNC(interact_menu,createAction),
    [QGVAR(CheckFuel),
        localize LSTRING(CheckFuel),
        QPATHTOF(ui\icon_refuel_interact.paa),
        {[_player, _target] call FUNC(checkFuel)},
        {[_player, _target] call FUNC(canCheckFuel)},
        {}, [], [0,0,0],
        REFUEL_ACTION_DISTANCE
    ] call EFUNC(interact_menu,createAction),
    [QGVAR(Return),
        localize LSTRING(Return),
        QPATHTOF(ui\icon_refuel_interact.paa),
        {[_player, _target] call FUNC(returnNozzle)},
        {[_player, _target] call FUNC(canReturnNozzle)},
        {}, [], [0,0,0],
        REFUEL_ACTION_DISTANCE
    ] call EFUNC(interact_menu,createAction)
];

// init menu for config refuel vehicles
{
    private _className = _x;
    [_className, 0, ["ACE_MainActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToClass);
    {
        [_className, 0, ["ACE_MainActions", QGVAR(Refuel)], _x] call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(actions);
    TRACE_1("add menu to static",_x);
} forEach _staticClasses;

{
    private _className = _x;
    [_className, 0, ["ACE_MainActions"], GVAR(mainAction), true] call EFUNC(interact_menu,addActionToClass);
    {
        [_className, 0, ["ACE_MainActions", QGVAR(Refuel)], _x, true] call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(actions);
    TRACE_1("add menu to dynamic",_x);
} forEach _baseDynamicClasses;

#ifdef DRAW_HOOKS_POS
addMissionEventHandler ["Draw3D", {
    private _source = cursorObject;
    private _cfgPos = getArray (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(hooks));
    private _dynPos = _source getVariable [QGVAR(hooks), _cfgPos];
    {
        drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [1,1,1,1], _source modelToWorldVisual _x, 1, 1, 0, format ["Hook %1", _forEachIndex]];
    } forEach _dynPos;
}];
#endif
