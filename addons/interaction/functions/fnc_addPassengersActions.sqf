#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Create one action per passenger.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [target, player, [params]] call ace_interaction_fnc_addPassengersActions
 *
 * Public: No
 */

params ["_vehicle", "_player"];

private _actions = [];

{
    private _unit = _x;

    if (_unit != _player && {getText (configFile >> "CfgVehicles" >> typeOf _unit >> "simulation") != "UAVPilot"}) then {
        private _icon = [
            "",
            "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa",
            "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa",
            "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
        ] select (([driver _vehicle, gunner _vehicle, commander _vehicle] find _unit) + 1);

        if (_unit getVariable [QEGVAR(captives,isHandcuffed), false]) then {
            _icon = QPATHTOEF(captives,UI\handcuff_ca.paa);
        };

        _actions pushBack [
            [
                format ["%1", _unit],
                [_unit, true] call EFUNC(common,getName),
                _icon,
                { 
                    //statement (Run on hover) - reset the cache so we will insert actions immedietly when hovering over new unit
                    TRACE_2("Cleaning Cache",_target,vehicle _target);
                    [vehicle _target, QEGVAR(interact_menu,ATCache_ACE_SelfActions)] call EFUNC(common,eraseCache);
                },
                {true},
                {
                    if (EGVAR(interact_menu,selectedTarget) isEqualTo _target) then {
                        _this call FUNC(addPassengerActions)
                    } else {
                        [] //not selected, don't waste time on actions
                    };
                },
                [_unit],
                {[0, 0, 0]},
                2,
                [false,false,false,true,false] //add run on hover (4th bit true)
                ] call EFUNC(interact_menu,createAction),
                [],
                _unit
            ];
    };
    false
} count crew _vehicle;

_actions
