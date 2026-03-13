#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Pushes a element to a synced list (broken into buckets to avoid re-pushing the same data on each update)
 *
 * Arguments:
 * 0: Namespace <OBJECT><NAMESPACE>
 * 1: Var name <STRING>
 * 2: Max Bucket Size <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "var"] call ace_common_fnc_syncedListGet
 *
 * Public: No
 */

params ["_namespace", "_var", ["_bucketMax", 10, [0]]];

private _total = [];
private _index = 0;
while {
    private _fullVar = format ["%1_%2", _var, _index];
    private _bucket = _namespace getVariable [_fullVar, []];
    _total append _bucket;
    _bucket isNotEqualTo []
} do {
    _index = _index + 1;
};

_total
