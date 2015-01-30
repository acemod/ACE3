/*  
    Author: aeroson
    
    Description:
        Sets the text on the dialog
    
    Parameters: 
        None
    
    Returns:
        Nothing
*/

#include "script_component.hpp"

#define TextIDC 11123

private["_text", "_ctrl"];

disableSerialization;

_text = _this select 0;
_ctrl = (uiNamespace getVariable QGVAR(dialog)) displayCtrl TextIDC;
_ctrl ctrlSetStructuredText parseText _text;
_ctrl ctrlCommit 0;
