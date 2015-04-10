#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

private["_player", "_currentFireMode"];

_currentFireMode = ACE_player getVariable["ACE_FIRE_SELECTION", ACE_JAV_FIREMODE_TOP];
if(_currentFireMode == ACE_JAV_FIREMODE_DIR) then {
    _currentFireMode = ACE_JAV_FIREMODE_TOP;
    
    __JavelinIGUITop ctrlSetTextColor __ColorGreen;
    __JavelinIGUIDir ctrlSetTextColor __ColorGray;
} else {
    _currentFireMode = ACE_JAV_FIREMODE_DIR;
    
    __JavelinIGUITop ctrlSetTextColor __ColorGray;
    __JavelinIGUIDir ctrlSetTextColor __ColorGreen;
};
ACE_player setVariable["ACE_FIRE_SELECTION", _currentFireMode, false];
