#include "..\script_component.hpp"

params ["_number"];

private _digit1 = if (_number <= -0.5) then [
    { QPATHTOF(rsc\vector_minus.paa) },
    { QPATHTOF(rsc\vector_blank.paa) }
];

private _posNumber = abs _number;
private _digit2 = floor (_posNumber / 10) mod 10;
private _digit3 = round (_posNumber) mod 10;

if (_digit2 > 0) then {
    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
} else {
    _digit2 = _digit1;
    _digit2 = QPATHTOF(rsc\vector_blank.paa);
};

_digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];

private _digit4 = QPATHTOF(rsc\vector_degree.paa);

[_digit1, _digit2, _digit3, _digit4]
