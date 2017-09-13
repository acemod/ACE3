#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", LINKFUNC(handleDisconnect)];
};

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
private _sourceClasses = [];
{
    private _fuelCargo = getNumber (_x >> QGVAR(fuelCargo));
    if (_fuelCargo > 0 || {_fuelCargo == REFUEL_INFINITE_FUEL}) then {
        private _sourceClass = configName _x;
        if (isClass (_x >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(Refuel))) exitWith {
            if (!isClass (inheritsFrom _x >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(Refuel))) then {
                ACE_DEPRECATED(FORMAT_1(QUOTE(GVAR(Refuel) interaction menu in %1),_sourceClass),"3.13.0",QUOTE(GVAR(fuelCargo) config value));
            };
        };
        // check if we can use actions with inheritance
        if (
            !isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init") // addActionToClass relies on XEH init
            || {configName _x isKindOf "Static"} // CBA_fnc_addClassEventHandler doesn't support "Static" class
        ) then {
            if (2 == getNumber (_x >> "scope")) then {
                [_sourceClass, 0, ["ACE_MainActions"], GVAR(mainAction)] call EFUNC(interact_menu,addActionToClass);
                {
                    [_sourceClass, 0, ["ACE_MainActions", QGVAR(Refuel)], _x] call EFUNC(interact_menu,addActionToClass);
                } forEach GVAR(actions);
                TRACE_1("add menu to static",_sourceClass);
            };
        } else {
            if (0 == {_sourceClass isKindOf _x} count _sourceClasses) then {
                _sourceClasses pushBack _sourceClass;
                [_sourceClass, 0, ["ACE_MainActions"], GVAR(mainAction), true] call EFUNC(interact_menu,addActionToClass);
                {
                    [_sourceClass, 0, ["ACE_MainActions", QGVAR(Refuel)], _x, true] call EFUNC(interact_menu,addActionToClass);
                } forEach GVAR(actions);
                TRACE_1("add menu to dynamic",_sourceClass);
            };
        };
    };
} forEach ('true' configClasses (configFile >> "CfgVehicles"));


#ifdef DRAW_HOOKS_POS
addMissionEventHandler ["Draw3D", {
    private _source = cursorObject;
    private _cfgPos = getArray (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(hooks));
    private _dynPos = _source getVariable [QGVAR(hooks), []];
    {
        drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [1,1,1,1], _source modelToWorldVisual _x, 1, 1, 0, format ["Hook %1", _forEachIndex]];
    } forEach ([_dynPos, _cfgPos] select (_dynPos isEqualTo []));
}];
#endif
