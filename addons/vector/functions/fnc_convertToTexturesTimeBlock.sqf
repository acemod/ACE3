#include "..\script_component.hpp"

params ["_number"];

private _tens = floor (_number / 10);
private _ones = _number mod 10;

private _digit1 = format [QPATHTOF(rsc\vector_%1.paa), _tens];
private _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _ones];

[_digit1, _digit2]
