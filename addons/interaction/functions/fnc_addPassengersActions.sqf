#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Create one action per passenger.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [cursorObject, player, [params]] call ace_interaction_fnc_addPassengersActions
 *
 * Public: No
 */

params ["_vehicle", "_player"];

// If player is not in vehicle and the crew is hostile, do not show any actions
if !(_player in _vehicle || {[_player, _vehicle] call FUNC(canInteractWithVehicleCrew)}) exitWith {
    [] // return
};

private _actions = [];
private _icon = "";

{
    _x params ["_unit", "_role"];

    _icon = [
        "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa",
        "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa",
        "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa",
        ""
    ] select (["driver", "gunner", "commander"] find _role);

    if (_unit getVariable [QEGVAR(captives,isHandcuffed), false]) then {
        _icon = QPATHTOEF(captives,UI\handcuff_ca.paa);
    };

    _actions pushBack [
        [
            str _unit,
            [_unit, true] call EFUNC(common,getName),
            [_icon, "#FFFFFF"],
            {
                // statement (Run on hover) - reset the cache so we will insert actions immediately when hovering over new unit
                TRACE_2("Cleaning Cache",_target,objectParent _target);
                [objectParent _target, QEGVAR(interact_menu,ATCache_ACE_SelfActions)] call EFUNC(common,eraseCache);
            },
            {true},
            {
                if (EGVAR(interact_menu,selectedTarget) isEqualTo _target) then {
                    _this call FUNC(addPassengerActions)
                } else {
                    [] // not selected, don't waste time on actions
                };
            },
            [_unit],
            {[0, 0, 0]},
            2,
            [false, false, false, true, false], // add run on hover (4th bit true)
            {if (["ace_medical_gui"] call EFUNC(common,isModLoaded)) then {call EFUNC(medical_gui,modifyActionTriageLevel)}}
        ] call EFUNC(interact_menu,createAction),
        [],
        _unit
    ];
} forEach ((fullCrew _vehicle) select {_x select 0 != _player && {!unitIsUAV (_x select 0)}});

_actions
