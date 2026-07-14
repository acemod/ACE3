#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets a synced list (broken into buckets to avoid re-pushing the same data on each update)
 *
 * Arguments:
 * 0: Namespace <OBJECT><NAMESPACE>
 * 1: Var name <STRING>
 * 2: Element <ANY>
 * 3: Max Bucket Size <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "var", "x"] call ace_common_fnc_syncedListPush
 *
 * Public: No
 */
params ["_namespace", "_var", "_line", ["_bucketMax", 10, [0]]];

private _fullVar = "";
private _bucket = [];
private _index = 0;
while {
    _fullVar = format ["%1_%2", _var, _index];
    _bucket = _namespace getVariable [_fullVar, []];
    (count _bucket) >= _bucketMax 
} do {
    _index = _index + 1;
};

_bucket pushBack _var;
_namespace setVariable [_fullVar, _bucket, true];
