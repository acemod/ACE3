#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Adds ACE actions for the player to command medics to heal injured units.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_medical_ai_fnc_addHealingCommandActions
 *
 * Public: No
 */

if (!hasInterface) exitWith {};

private _action = [
    QGVAR(heal),
    localize "STR_A3_Task180_name",
    "",
    {},
    {_player == leader _player},
    {
        private _units = units _player;

        (_units select {_x call EFUNC(common,isAwake) && {_x call EFUNC(medical_treatment,isMedic)} && {!(_x call EFUNC(common,isPlayer))}}) apply {
            [
                [
                    QGVAR(medicHeal_) + str _x,
                    format ["%1: (%2)", [_x, false, true] call EFUNC(common,getName), groupId _x],
                    "",
                    {},
                    {true},
                    {
                        (_this select 2) params ["_healer", "_units"];

                        (_units select {_x call FUNC(isInjured)}) apply {
                            [
                                [
                                    QGVAR(healUnit_) + str _x,
                                    format [localize "str_action_heal_soldier", ([_x, false, true] call EFUNC(common,getName)) + " (" + str groupId _x + ")"],
                                    "",
                                    {
                                        (_this select 2) params ["_healer", "_target"];

                                        private _assignedMedic = _target getVariable [QGVAR(assignedMedic), objNull];

                                        // Remove from previous medic's queue
                                        if (!isNull _assignedMedic && {_healer != _assignedMedic}) then {
                                            private _healQueue = _assignedMedic getVariable [QGVAR(healQueue), []];

                                            _healQueue deleteAt (_healQueue find _target);

                                            _assignedMedic setVariable [QGVAR(healQueue), _healQueue];
                                        };

                                        _target setVariable [QGVAR(assignedMedic), _healer];

                                        // Add to new medic
                                        private _healQueue = _healer getVariable [QGVAR(healQueue), []];

                                        _healQueue deleteAt (_healQueue find _target);
                                        _healQueue insert [0, [_target]];

                                        _healer setVariable [QGVAR(healQueue), _healQueue];
                                    },
                                    {true},
                                    {},
                                    [_healer, _x]
                                ] call EFUNC(interact_menu,createAction),
                                [],
                                _x
                            ]
                        };
                    },
                    [_x, _units]
                ] call EFUNC(interact_menu,createAction),
                [],
                _x
            ]
        };
    }
] call EFUNC(interact_menu,createAction);

["CAManBase", 1, ["ACE_SelfActions"], _action, true] call EFUNC(interact_menu,addActionToClass);
