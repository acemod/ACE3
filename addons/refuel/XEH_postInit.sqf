#include "script_component.hpp"

// Menus and initSource EH need to be defined before the server raises the EH on the client, otherwise it won't add the actions
if (hasInterface) then {
    GVAR(mainAction) = [
        QGVAR(Refuel),
        localize LSTRING(Refuel),
        QPATHTOF(ui\icon_refuel_interact.paa),
        {},
        {
            alive _target
            && {[_player, _target, [INTERACT_EXCEPTIONS]] call EFUNC(common,canInteractWith)}
            && {REFUEL_DISABLED_FUEL != ([_target] call FUNC(getCapacity))}
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

    [QGVAR(initSource), LINKFUNC(initSource)] call CBA_fnc_addEventHandler;
};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {
        GVAR(mainAction) = nil;
        GVAR(actions) = nil;
    };

    ["All", "InitPost", {
        params ["_vehicle"];
        if !(typeOf _vehicle in (uiNamespace getVariable QGVAR(cacheRefuelCargo))) exitWith {};
        TRACE_3("initPost",_vehicle,local _vehicle,getFuelCargo _vehicle);
        _vehicle call FUNC(initObject);
    }, true, ["Man"], true] call CBA_fnc_addClassEventHandler;

    if (isServer) then {
        addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
    };

    private _staticClasses = keys (uiNamespace getVariable QGVAR(cacheRefuelClassesStatic));
    private _staticFound = [];
    {
        // terrain and editor pumps
        private _objects = _x allObjects 0;
        if (_objects isEqualTo []) then {continue};
        _staticFound pushBack [_x, count _objects];
        {
            _x call FUNC(initObject);
        } forEach _objects;
    } forEach _staticClasses;
    TRACE_1("init terrain",_staticFound);

    if (!hasInterface) exitWith {};

    ["isNotRefueling", {!((_this select 0) getVariable [QGVAR(isRefueling), false])}] call EFUNC(common,addCanInteractWithCondition);

    ["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;

    private _baseDynamicClasses = keys (uiNamespace getVariable QGVAR(cacheRefuelClassesBaseDynamic));

    // init menu for config refuel vehicles
    {
        private _className = _x;
        [_className, 0, ["ACE_MainActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToClass);
        {
            [_className, 0, ["ACE_MainActions", QGVAR(Refuel)], _x] call EFUNC(interact_menu,addActionToClass);
        } forEach GVAR(actions);
        TRACE_1("add menu to static",_className);
    } forEach _staticClasses;

    {
        private _className = _x;
        [_className, 0, ["ACE_MainActions"], GVAR(mainAction), true] call EFUNC(interact_menu,addActionToClass);
        {
            [_className, 0, ["ACE_MainActions", QGVAR(Refuel)], _x, true] call EFUNC(interact_menu,addActionToClass);
        } forEach GVAR(actions);
        TRACE_1("add menu to dynamic",_className);
    } forEach _baseDynamicClasses;

    #ifdef DRAW_HOOKS_POS
    addMissionEventHandler ["Draw3D", {
        private _source = cursorObject;
        private _cfgPos = getArray (configOf _source >> QGVAR(hooks));
        private _dynPos = _source getVariable [QGVAR(hooks), _cfgPos];
        {
            drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [1,1,1,1], _source modelToWorldVisual _x, 1, 1, 0, format ["Hook %1", _forEachIndex]];
        } forEach _dynPos;
    }];
    #endif
}] call CBA_fnc_addEventHandler;
