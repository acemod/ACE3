/*
 * Author: esteldunedain
 * Create one action per passenger
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
#include "script_component.hpp"
params ["_vehicle", "_player", "_parameters"];

private ["_actions"];
_actions = [];

{
    private ["_unit", "_icon"];
    _unit = _x;
    if ((_unit != _player) && {(getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "simulation")) != "UAVPilot"}) then {
        _icon = switch _unit do {
            case (driver _vehicle): { QUOTE(A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa) };
            case (gunner _vehicle): { QUOTE(A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa) };
            case (commander _vehicle): { QUOTE(A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa) };
            default { "" };
        };
        if (_unit getVariable [QEGVAR(captives,isHandcuffed), false]) then {
            _icon = QUOTE(PATHTOEF(captives,UI\handcuff_ca.paa));
        };
        _actions pushBack
            [
                [
                    str(_unit),
                    [_unit, true] call EFUNC(common,getName),
                    _icon,
                    {},
                    {true},
                    {_this call FUNC(addPassengerActions);},
                    [_unit]
                ] call EFUNC(interact_menu,createAction),
                [],
                _unit
            ];
    };
    true
} count crew _vehicle;

_actions
