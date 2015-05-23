#include "script_component.hpp"

ADDON = false;

// prepare functions
// event handler functions
PREP(editingDraw);
PREP(editingDraw_editBFT);
PREP(KeyDown);
PREP(KeyUp);
PREP(mapDraw);
PREP(MouseButtonDown);
PREP(MouseButtonUp);

// tooltip functions
PREP(tt_setText);
PREP(tt_setPos);
PREP(tt_getText);

// gui functions
PREP(initBFTEdit);

GVAR(editingDraw) = -1;
GVAR(editingDraw_editBFT) = -1;
GVAR(editkeydown) = false;
GVAR(mousebuttondown) = false;
GVAR(mousepos) = [0,0];
GVAR(mouseover) = ["",[]];
GVAR(selection) = ["",[]];

ADDON = true;
