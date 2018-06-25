#include "script_component.hpp"
/*
 * Author: commy2
 * converts azimuth into array of textures for the vectors scripted info control
 *
 * Arguments:
 * 0: Number <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5] call ace_vector_fnc_convertToTexturesDegree
 *
 * Public: No
 */

params ["_number"];

if (GVAR(useMil)) then {

    _number = round (6400 / 360 * _number);
    if (_number isEqualTo 6400) then {_number = 0};

    [_number] call FUNC(convertToTexturesDistance)    // return

} else {

    _number = round _number;

    private _isNegative = _number < 0;

    _number = abs _number;
    if (_number isEqualTo 360) then {_number = 0};

    private _digit1 = floor (_number / 100);
    private _digit2 = floor (_number / 10) - _digit1 * 10;
    private _digit3 = _number mod 10;
    private _digit4 = QPATHTOF(rsc\vector_degree.paa);

    if (_isNegative) then {

        if (_digit1 isEqualTo 0) then {
            if (_digit2 isEqualTo 0) then {
                _digit1 = "";
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            } else {
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            };
        } else {
            _digit1 = QPATHTOF(rsc\vector_minus.paa);
            _digit2 = QPATHTOF(rsc\vector_minus.paa);
            _digit3 = QPATHTOF(rsc\vector_minus.paa);
            _digit4 = QPATHTOF(rsc\vector_minus.paa);
        };

    } else {

        if (_digit1 isEqualTo 0) then {
            if (_digit2 isEqualTo 0) then {
                _digit1 = "";
                _digit2 = "";
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            } else {
                _digit1 = "";
                _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
            };
        } else {
            _digit1 = format [QPATHTOF(rsc\vector_%1.paa), _digit1];
            _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
            _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
        };

    };

    [_digit1, _digit2, _digit3, _digit4]    // return
}
