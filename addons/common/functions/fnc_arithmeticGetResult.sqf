/*
 * Author: PabstMirror
 * Gets arithmetic result from a set.
 *
 * Arguments:
 * 0: Namespace <OBJECT><LOCATION><MISSIONNAMESPACE>
 * 1: Number Set ID <STRING>
 * 2: Operation (sum, product, min, max, avg) <STRING>
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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_namespace", "_setID", "_op"];
TRACE_3("params",_namespace,_setID,_op);

private _data = (_namespace getVariable _setID) param [2, []];

switch (_op) do {
    case ("sum"): {
        private _result = 0;
        {
            _result = _result + (call _x);
            nil
        } count _data;
        _result // return
    };
    case ("product"): {
        private _result = 1;
        {
            _result = _result * (call _x);
            nil
        } count _data;
        _result // return
    };
    case ("min"): {
        private _result = 1e99;
        {
            _result = _result min (call _x);
            nil
        } count _data;
        _result // return
    };
    case ("max"): {
        private _result = -1e99;
        {
            _result = _result max (call _x);
            nil
        } count _data;
        _result // return
    };
    case ("avg"): {
        private _result = 0;
        {
            _result = _result + (call _x);
            nil
        } count _data;
        _result / (count _data); // return
    };
    default {3735928559};
};
