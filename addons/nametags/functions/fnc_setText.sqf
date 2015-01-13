/*  
    Author: aeroson
    
    Description:
        Sets the text on the dialog
    
    Parameters: 
        None
    
    Returns:
        Nothing
*/

#define GVAR(TextIDC) 11123

private["_text", "_ctrl"];

disableSerialization;

_text = _this select 0;
_ctrl = (uiNamespace getVariable QGVAR(dialog)) displayCtrl GVAR(TextIDC);
_ctrl ctrlSetStructuredText parseText _text;
_ctrl ctrlCommit 0;
