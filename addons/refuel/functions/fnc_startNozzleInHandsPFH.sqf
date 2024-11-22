#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * PFH while nozzle is in hands.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_startNozzleInHandsPFH
 *
 * Public: No
 */

#define DROP_NOZZLE [_unit, _nozzle] call FUNC(dropNozzle);
#define UNHOLSTER_WEAPON \
    _unit selectWeapon (_unit getVariable QGVAR(selectedWeaponOnRefuel)); \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
#define END_PFH \
    _unit setVariable [QGVAR(hint), nil]; \
    call EFUNC(interaction,hideMouseHint); \
    [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set); \
    [_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set); \
    [_idPFH] call CBA_fnc_removePerFrameHandler;

params ["_unit", "_nozzle"];
TRACE_2("start",_unit,_nozzle);

[{
    params ["_args", "_idPFH"];
    _args params ["_unit", "_nozzle"];

    if !(
        _unit call EFUNC(common,isAwake)
        && {"" isEqualTo currentWeapon _unit || {_unit call EFUNC(common,isSwimming)}}
        && {[_unit, objNull, [INTERACT_EXCEPTIONS, "notOnMap"]] call EFUNC(common,canInteractWith)}
    ) exitWith {
        TRACE_3("stop dead/weapon/interact/uncon",_unit,alive _unit,currentWeapon _unit);
        DROP_NOZZLE
        _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
        END_PFH
    };

    // check drop from external events
    if (isNull (_unit getVariable [QGVAR(nozzle), objNull])) exitWith {
        TRACE_2("stop drop",_unit,_nozzle);
        UNHOLSTER_WEAPON
        END_PFH
    };

    private _source = _nozzle getVariable [QGVAR(source), objNull];
    if !(alive _source) exitWith {
        TRACE_3("stop source",_unit,_nozzle,_source);
        DROP_NOZZLE
        private _rope = _nozzle getVariable [QGVAR(rope), objNull];
        if !(isNull _rope) then {
            ropeDestroy _rope;
        };
        private _helper = _nozzle getVariable [QGVAR(helper), objNull];
        if !(isNull _helper) then {
            deleteVehicle _helper;
        };
        deleteVehicle _nozzle;
        UNHOLSTER_WEAPON
        END_PFH
    };

    if (isNull objectParent _unit && {_unit isNotEqualTo ACE_player}) exitWith {
        TRACE_2("stop vehicle/player",_unit,vehicle _unit);
        DROP_NOZZLE
        UNHOLSTER_WEAPON
        END_PFH
    };

    // check hoseLength < distance
    if (
        !(_nozzle getVariable [QGVAR(jerryCan), false])
        && {((_source getVariable [QGVAR(hoseLength), GVAR(hoseLength)]) - 2) < _unit distance (_source modelToWorld (_nozzle getVariable QGVAR(attachPos)))}
    ) exitWith {
        TRACE_1("stop length",_unit);
        DROP_NOZZLE
        UNHOLSTER_WEAPON
        END_PFH
        [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
    };

    private _hintLMB = "";
    private _hintRMB = LELSTRING(common,Drop);

    getCursorObjectParams params ["_cursorObject", "", "_distance"];
    if (!isNull _cursorObject && {_distance < REFUEL_NOZZLE_ACTION_DISTANCE}) then {
        if ([_cursorObject] call FUNC(canConnectNozzle)) then {
            _hintLMB = localize ([LSTRING(Connect), LSTRING(ConnectFuelCanister)] select (_nozzle getVariable [QGVAR(jerryCan), false]));
        };
        if ([_unit, _cursorObject] call FUNC(canReturnNozzle)) then {
            _hintRMB = localize LSTRING(Return);
        };
    };

    private _hint = [_hintLMB, _hintRMB];
    if (_hint isNotEqualTo (_unit getVariable [QGVAR(hint), []])) then {
        _unit setVariable [QGVAR(hint), _hint];
        _hint call EFUNC(interaction,showMouseHint);
    };
}, 0, [_unit, _nozzle]] call cba_fnc_addPerFrameHandler;
