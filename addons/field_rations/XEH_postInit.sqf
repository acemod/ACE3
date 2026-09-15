#include "script_component.hpp"

if !(hasInterface) exitWith {};

["CBA_settingsInitialized", {
    // Exit if not enabled
    if (!XGVAR(enabled)) exitWith {};

    // Add Advanced Fatigue duty factor
    if (XGVAR(affectAdvancedFatigue) && {missionNamespace getVariable [QEGVAR(advanced_fatigue,enabled), false]}) then {
        [QUOTE(ADDON), {
            linearConversion [50, 100, _this getVariable [QXGVAR(thirst), 0], 1, 1.4, true] * linearConversion [50, 100, _this getVariable [QXGVAR(hunger), 0], 1, 1.1, true]
        }] call EFUNC(advanced_fatigue,addDutyFactor);
        TRACE_1("Added duty factor",XGVAR(affectAdvancedFatigue));
    };

    // Compile water source actions
    GVAR(mainAction) = [
        QGVAR(waterSource),
        LLSTRING(WaterSource),
        QPATHTOF(ui\icon_water_tap.paa),
        {true},
        {
            private _waterSource = _target getVariable [QGVAR(waterSource), objNull];

            alive _waterSource
            && {XGVAR(waterSourceActions) != 0}
            && {_waterSource call FUNC(getRemainingWater) != REFILL_WATER_DISABLED}
            && {[_player, _waterSource] call EFUNC(common,canInteractWith)}
        },
        {
            private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
            [_waterSource, _player] call FUNC(getRefillChildren);
        },
        [],
        {[0, 0, 0]},
        2,
        [false, false, false, false, true]
    ] call EFUNC(interact_menu,createAction);

    GVAR(subActions) = [
        [
            QGVAR(checkWater),
            LLSTRING(CheckWater),
            QPATHTOF(ui\icon_water_tap.paa),
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                [_player, _waterSource] call FUNC(checkWater);
            },
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                (_waterSource call FUNC(getRemainingWater)) != REFILL_WATER_INFINITE
            }
        ] call EFUNC(interact_menu,createAction),
        [
            QGVAR(drinkFromSource),
            LLSTRING(DrinkFromSource),
            QPATHTOF(ui\icon_water_tap.paa),
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                [_player, _waterSource] call FUNC(drinkFromSource);
            },
            {
                private _waterSource = _target getVariable [QGVAR(waterSource), objNull];
                [_player, _waterSource] call FUNC(canDrinkFromSource);
            }
        ] call EFUNC(interact_menu,createAction)
    ];

    // Add water source actions to helper
    [QGVAR(helper), 0, [], GVAR(mainAction)] call EFUNC(interact_menu,addActionToClass);
    {
        [QGVAR(helper), 0, [QGVAR(waterSource)], _x] call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(subActions);

    // Add inventory context menu option to consume items
    private _eatOrDrinkCondition = [
        {true},
        {
            params ["", "", "_item"];

            XGVAR(enabled) && {
                private _config = _item call CBA_fnc_getItemConfig;
                getNumber (_config >> QXGVAR(thirstQuenched)) > 0
                || {getNumber (_config >> QXGVAR(hungerSatiated)) > 0}
            }
        }
    ];
    private _eatOrDrinkStatement = {
        params ["_unit", "", "_item"];
        private _itemConfig = _item call CBA_fnc_getItemConfig;
        private _isMagazine = isClass (configFile >> "CfgMagazines" >> _item);
        [objNull, _unit, [_item, _itemConfig, _isMagazine]] call FUNC(consumeItem);
        false // Close context menu
    };

    {
        [_x, ["CONTAINER"], LSTRING(EatDrink), [], QPATHTOF(ui\icon_survival.paa),
            _eatOrDrinkCondition, _eatOrDrinkStatement
        ] call CBA_fnc_addItemContextMenuOption;
    } forEach ["ACE_ItemCore", "CA_Magazine"];

    // Add water source helpers when interaction menu is opened
    ["ace_interactMenuOpened", LINKFUNC(addWaterSourceInteractions)] call CBA_fnc_addEventHandler;

    // Add status modifiers
    if (GETEGVAR(medical,enabled,false)) then {
        [0, {
            if (_this getVariable [QEGVAR(medical,isBleeding), false]) exitWith {
                0.5
            };
            -1 * count (_this getVariable [QEGVAR(medical,ivBags), []]);
        }] call FUNC(addStatusModifier);
    };

    if (["ace_weather"] call EFUNC(common,isModLoaded)) then {
        [0, {
            linearConversion [40, 60, missionNamespace getVariable [QEGVAR(weather,currentTemperature), 25], 0, 1.5, true];
        }] call FUNC(addStatusModifier);
    };

    if (["ace_dragging"] call EFUNC(common,isModLoaded)) then {
        [2, {
            if (_this getVariable [QEGVAR(dragging,isDragging), false] || {_this getVariable [QEGVAR(dragging,isCarrying), false]}) exitWith {
                1
            };
            0
        }] call FUNC(addStatusModifier);
    };

    // Handle returning to normal transparency once interaction menu is closed
    GVAR(hudInteractionHover) = false;

    ["ace_interactMenuClosed", {
        GVAR(hudInteractionHover) = false;
    }] call CBA_fnc_addEventHandler;

    // Add respawn eventhandler to reset necessary variables, done through script so only added if field rations is enabled
    ["CAManBase", "respawn", LINKFUNC(handleRespawn)] call CBA_fnc_addClassEventHandler;

    // Add status effect to block hunger/thirst updates
    ["field_rations_blockUpdates", false, [], false, QGVAR(blockUpdates)] call EFUNC(common,statusEffect_addType);

    [QGVAR(blockUpdates), {
        params ["_object", "_set"];
        TRACE_2("blockUpdates EH",_object,_set);
        _object setVariable [QGVAR(blockUpdates), _set > 0];
    }] call CBA_fnc_addEventHandler;

    // Start update loop
    [LINKFUNC(update), CBA_missionTime + MP_SYNC_INTERVAL, 1] call CBA_fnc_waitAndExecute;

    #ifdef DEBUG_MODE_FULL
        ["ACE_player thirst", {ACE_player getVariable [QXGVAR(thirst), 0]}, [true, 0, 100]] call EFUNC(common,watchVariable);
        ["ACE_player hunger", {ACE_player getVariable [QXGVAR(hunger), 0]}, [true, 0, 100]] call EFUNC(common,watchVariable);
    #endif
}] call CBA_fnc_addEventHandler;
