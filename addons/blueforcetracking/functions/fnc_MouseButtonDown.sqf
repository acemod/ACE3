#include "script_component.hpp"

if (_this select 1 != 0) exitWith {};

switch (true) do {
    case (!GVAR(editkeydown) && count (GVAR(mouseover) select 1) != 0): {
        // left click on any icon
        private "_selection";
        _selection = +GVAR(mouseover);
        GVAR(selection) = _selection;

        (_this select 0) ctrlMapAnimAdd [0.5,MAPANIMZOOM,DEV_GETPOSITION(_selection)];
        GVAR(editingDraw_editBFT) = (_this select 0) ctrlAddEventhandler ["Draw",FUNC(editingDraw_editBFT)];

        [(_this select 0),GVAR(selection)] call FUNC(initBFTEdit);
    };
    case (GVAR(editkeydown) && GVAR(mouseover) select 0 == 1): {
        // left button holded on salute report
    };
};
