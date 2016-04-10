#include "script_component.hpp"

params ["_ctrl", "_key"];

if (_key != 0) exitWith {};

switch (true) do {
    case (!GVAR(editkeydown) && count (GVAR(mouseover) select 1) != 0): {
        // left click on any icon
        private "_selection";
        _selection = +GVAR(mouseover);
        GVAR(selection) = _selection;

        _ctrl ctrlMapAnimAdd [0.5,MAPANIMZOOM,AD_GET_POSITION(_selection)];
        GVAR(editingDraw_editBFT) = _ctrl ctrlAddEventhandler ["Draw",FUNC(editingDraw_editBFT)];

        [_ctrl, GVAR(selection)] call FUNC(initBFTEdit);
    };
    case (GVAR(editkeydown) && (GVAR(mouseover) select 0 == 1)): {
        // left button holded on salute report
    };
};
