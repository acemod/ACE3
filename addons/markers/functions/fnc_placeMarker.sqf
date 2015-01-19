// by commy2
#include "script_component.hpp"

if (_this select 1 == 1) then {
    disableserialization;
    _display = _this select 0;

    _pos = ctrlPosition (_display displayCtrl 102);
    _pos = [
        (_pos select 0) + (_pos select 2) / 2,
        (_pos select 1) + (_pos select 3) / 2
    ];

    switch (true) do {
        case (!isNull findDisplay 12): {
            _pos = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld _pos;
        };
        case (!isNull findDisplay 37): {
            _pos = (findDisplay 37 displayCtrl 51) ctrlMapScreenToWorld _pos;
        };
        case (!isNull findDisplay 52): {
            _pos = (findDisplay 52 displayCtrl 51) ctrlMapScreenToWorld _pos;
        };
        case (!isNull findDisplay 53): {
            _pos = (findDisplay 53 displayCtrl 51) ctrlMapScreenToWorld _pos;
        };
    };

    // set and send marker data the next frame. the actual marker isn't created yet
    [
        {

            [QGVAR(setMarkerNetwork), [
                allMapMarkers select (count allMapMarkers - 1), [
                    GETGVAR(currentMarkerShape,0),
                    GETGVAR(currentMarkerColor,0),
                    _this,
                    GETGVAR(currentMarkerAngle,0)
                ]
            ]] call EFUNC(common,globalEvent);

        },
        _pos
    ] call EFUNC(common,execNextFrame);

};
