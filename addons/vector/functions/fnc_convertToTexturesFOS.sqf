/* by commy2

converts rangefinder distance into array of textures for the vectors scripted info control

*/

#include "script_component.hpp"

private ["_number", "_coordinate", "_isNegative"];

_number = _this select 0;
_coordinate = _this select 1;

_number = round (_number select _coordinate);
_isNegative = _number < 0;
_number = abs _number;

if (_number > 9999) exitWith {
    [QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa))]    // return
};

private ["_digit0", "_digit1", "_digit2", "_digit3", "_digit4"];

_digit0 = "";
_digit1 = floor (_number / 1000);
_digit2 = floor (_number / 100) - _digit1 * 10;
_digit3 = floor (_number / 10) - _digit1 * 100 - _digit2 * 10;
_digit4 = _number mod 10;

switch (_coordinate) do {
    case 0 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_l.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_l.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_l.paa));
                    _digit1 = "";
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_r.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_r.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_r.paa));
                    _digit1 = "";
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };
        };

    };

    case 1 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                    _digit1 = "";
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_a.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit3 = "";
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_a.paa));
                        _digit1 = "";
                        _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_a.paa));
                    _digit1 = "";
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };
        };

    };

    case 2 : {

        if (_isNegative) then {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_u.paa));
                        _digit1 = QUOTE(PATHTOF(rsc\vector_p.paa));
                        _digit2 = "";
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_u.paa));
                        _digit1 = QUOTE(PATHTOF(rsc\vector_p.paa));
                        _digit2 = "";
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_u.paa));
                    _digit1 = QUOTE(PATHTOF(rsc\vector_p.paa));
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };

        } else {

            if (_digit1 == 0) then {
                if (_digit2 == 0) then {
                    if (_digit3 == 0) then {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                        _digit1 = QUOTE(PATHTOF(rsc\vector_n.paa));
                        _digit2 = "";
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                        _digit4 = "";
                    } else {
                        _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                        _digit1 = QUOTE(PATHTOF(rsc\vector_n.paa));
                        _digit2 = "";
                        _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                        _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                    };
                } else {
                    _digit0 = QUOTE(PATHTOF(rsc\vector_d.paa));
                    _digit1 = QUOTE(PATHTOF(rsc\vector_n.paa));
                    _digit2 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit2];
                    _digit3 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit3];
                    _digit4 = format [QUOTE(PATHTOF(rsc\vector_%1.paa)), _digit4];
                };
            } else {
                _digit0 = "";
                _digit1 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit2 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit3 = QUOTE(PATHTOF(rsc\vector_minus.paa));
                _digit4 = QUOTE(PATHTOF(rsc\vector_minus.paa));
            };
        };

    };
};

// trap errors
if ({_x isEqualType ""} count [_digit0, _digit1, _digit2, _digit3, _digit4] < 5) exitWith {
    [QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa)), QUOTE(PATHTOF(rsc\vector_minus.paa))]    // return
};

[_digit0, _digit1, _digit2, _digit3, _digit4]
