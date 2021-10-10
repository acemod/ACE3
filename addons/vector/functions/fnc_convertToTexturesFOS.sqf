#include "script_component.hpp"
/*
 * Author: commy2
 * converts rangefinder distance into array of textures for the vectors scripted info control
 *
 * Arguments:
 * 0: Number <NUMBER>
 * 1: Number <NUMBER>
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * [5, 6] call ace_vector_fnc_convertToTexturesFOS
 *
 * Public: No
 */
params ["_number", "_coordinate"];

_number = round (_number select _coordinate);
private _isNegative = _number < 0;
_number = abs _number;

if (_number > 9999) exitWith {
    [QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa)]    // return
};

private _digit0 = "";
private _digit1 = floor (_number / 1000);
private _digit2 = floor (_number / 100) - _digit1 * 10;
private _digit3 = floor (_number / 10) - _digit1 * 100 - _digit2 * 10;
private _digit4 = _number mod 10;

switch (_coordinate) do {
    case 0 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_l.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_l.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_l.paa);
                    _digit1 = "";
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_r.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_r.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_r.paa);
                    _digit1 = "";
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };
        };

    };

    case 1 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_d.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_d.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_d.paa);
                    _digit1 = "";
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_a.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_a.paa);
                        _digit1 = "";
                        _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_a.paa);
                    _digit1 = "";
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };
        };

    };

    case 2 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_u.paa);
                        _digit1 = QPATHTOF(rsc\vector_p.paa);
                        _digit2 = "";
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_u.paa);
                        _digit1 = QPATHTOF(rsc\vector_p.paa);
                        _digit2 = "";
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_u.paa);
                    _digit1 = QPATHTOF(rsc\vector_p.paa);
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QPATHTOF(rsc\vector_d.paa);
                        _digit1 = QPATHTOF(rsc\vector_n.paa);
                        _digit2 = "";
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                        _digit4 = "";
                    } else {
                        _digit0 = QPATHTOF(rsc\vector_d.paa);
                        _digit1 = QPATHTOF(rsc\vector_n.paa);
                        _digit2 = "";
                        _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                        _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                    };
                } else {
                    _digit0 = QPATHTOF(rsc\vector_d.paa);
                    _digit1 = QPATHTOF(rsc\vector_n.paa);
                    _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _digit2];
                    _digit3 = format [QPATHTOF(rsc\vector_%1.paa), _digit3];
                    _digit4 = format [QPATHTOF(rsc\vector_%1.paa), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QPATHTOF(rsc\vector_minus.paa);
                _digit2 = QPATHTOF(rsc\vector_minus.paa);
                _digit3 = QPATHTOF(rsc\vector_minus.paa);
                _digit4 = QPATHTOF(rsc\vector_minus.paa);
            };
        };

    };
};

// trap errors
if !([_digit0, _digit1, _digit2, _digit3, _digit4] isEqualTypeAll "") exitWith {
    [QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa), QPATHTOF(rsc\vector_minus.paa)]    // return
};

[_digit0, _digit1, _digit2, _digit3, _digit4]
