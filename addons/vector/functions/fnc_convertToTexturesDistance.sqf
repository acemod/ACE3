/*
 * Author: commy2
 * converts rangefinder distance into array of textures for the vectors scripted info control
 *
 * Arguments:
 * 0: Number <NUMBER>
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * [5] call ace_vector_fnc_convertToTexturesDistance
 *
 * Public: No
 */


#include "script_component.hpp"

private ["_number", "_isNegative"];

_number = _this select 0;

_number = round _number;
_isNegative = _number < 0;
_number = abs _number;

if (_number >= 10000) exitWith {
    [QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa)]    // return
};

private ["_digit1", "_digit2", "_digit3", "_digit4"];

_digit1 = floor (_number / 1000);
_digit2 = floor (_number / 100) - _digit1 * 10;
_digit3 = floor (_number / 10) - _digit1 * 100 - _digit2 * 10;
_digit4 = _number mod 10;

if (_isNegative) then {

    if (_digit1 == 0) then {
        if (_digit2 == 0) then {
            if (_digit3 == 0) then {
                _digit1 = "";
                _digit2 = "";
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
            } else {
                _digit1 = "";
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
            };
        } else {
            _digit1 = QPATHTOF(rsc\vector_minus.paa);
            _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
            _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
        };
    } else {
        _digit1 = QPATHTOF(rsc\vector_minus.paa);
        _digit2 = QPATHTOF(rsc\vector_minus.paa);
        _digit3 = QPATHTOF(rsc\vector_minus.paa);
        _digit4 = QPATHTOF(rsc\vector_minus.paa);
    };

} else {

    if (_digit1 == 0) then {
        if (_digit2 == 0) then {
            if (_digit3 == 0) then {
                _digit1 = "";
                _digit2 = "";
                _digit3 = "";
                _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
            } else {
                _digit1 = "";
                _digit2 = "";
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
            };
        } else {
            _digit1 = "";
            _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
            _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
        };
    } else {
        _digit1 = format [QPATHTOF(rsc\vector_%1.paa), _digit1];
        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
        _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
    };

};

[_digit1, _digit2, _digit3, _digit4]
