#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Returns the arithmetic result of performing the given operation on a set.
 *
 * Arguments:
 * 0: Namespace <OBJECT|LOCATION|NAMESPACE>
 * 1: Number Set ID <STRING>
 * 2: Operation (max, min, sum, product, avg) (Case Sensitive) <STRING>
 *
 * Return Value:
 * Value <NUMBER>
 *
 * Example:
 * [ace_player, "ace_aimCoefficents", "product"] call ace_common_fnc_arithmeticGetResult
 * [missionNameSpace, "ace_hearing", "min"] call ace_common_fnc_arithmeticGetResult
 *
 * Public: Yes
 */

params ["_namespace", "_setID", "_operation"];
TRACE_3("arithmeticGetResult",_namespace,_setID,_operation);

private _data = (_namespace getVariable _setID) param [2, [{0}]];

switch (_operation) do {
    case "max": {
        selectMax (_data apply {call _x})
    };
    case "min": {
        selectMin (_data apply {call _x})
    };
    case "sum": {
        private _result = 0;

        {
            _result = _result + call _x;
        } forEach _data;

        _result
    };
    case "product": {
        private _result = 1;

        {
            _result = _result * call _x;
        } forEach _data;

        _result
    };
    case "avg": {
        private _result = 0;

        {
            _result = _result + call _x;
        } forEach _data;

        _result / count _data
    };
    default {3735928559};
};
