#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_1("settingsInitialized",GVAR(enabledFor));

    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    ["CAManBase", "Hit", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastHit), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    ["CAManBase", "Suppressed", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastSuppressed), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    // Add command actions to command AI medics to treat other units
    if (hasInterface && {GVAR(requireItems) > 0}) then {
        private _action = [QGVAR(heal), "Command Healing", "", {}, {_player == leader _player}, {
            private _units = units _player;

            (_units select {_x call EFUNC(common,isAwake) && {_x call EFUNC(medical_treatment,isMedic)} && {!(_x call EFUNC(common,isPlayer))}}) apply {
                [
                    [
                        QGVAR(medicHeal_) + str _x,
                        [_x, false, true] call EFUNC(common,getName),
                        "",
                        {},
                        {true},
                        {
                            (_this select 2) params ["_healer", "_units"];

                            (_units select {_x call FUNC(isInjured)}) apply {
                                [
                                    [
                                        QGVAR(healUnit_) + str _x,
                                        format ["%1: %2", "Heal", [_x, false, true] call EFUNC(common,getName)],
                                        "",
                                        {
                                            (_this select 2) params ["_healer", "_target"];

                                            private _assignedMedic = _target getVariable [QGVAR(assignedMedic), objNull];

                                            // Remove from previous medic's queue
                                            if (!isNull _assignedMedic) then {
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
        }] call EFUNC(interact_menu,createAction);

        ["CAManBase", 1, ["ACE_SelfActions"], _action, true] call EFUNC(interact_menu,addActionToClass);
    };

    if (GVAR(requireItems) == 2) then {
        ["CAManBase", "InitPost", {
            [{
                params ["_unit"];
                if ((!local _unit) || {!alive _unit} || {isPlayer _unit}) exitWith {};
                TRACE_2("replacing medical items on AI",_unit,typeOf _unit);
                [_unit] call EFUNC(common,replaceRegisteredItems);
            }, _this] call CBA_fnc_execNextFrame; // need to delay a frame before modifying items in a backpack
        }, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;
    };

    #include "stateMachine.inc.sqf"
}] call CBA_fnc_addEventHandler;
