#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Provides a unified interface for different control types used in the Arsenal system.
 * This eliminates the need for runtime control type detection and provides consistent
 * operations across listbox, listnbox, and tree controls.
 *
 * Arguments:
 * 0: Operation <STRING> - "add", "clear", "setData", "getData", "setPicture", "setTooltip", "setCurSel", "getCurSel", "count", "setColor"
 * 1: Control <CONTROL>
 * 2: Arguments <ARRAY> - Operation-specific arguments
 *
 * Return Value:
 * <ANY> - Operation-specific return value
 *
 * Example:
 * ["add", _control, ["Item Name"]] call ace_arsenal_fnc_controlInterface
 * ["setData", _control, [0, "className"]] call ace_arsenal_fnc_controlInterface
 *
 * Public: No
 */

params ["_operation", "_control", "_args"];

private _controlType = ctrlType _control;

switch (_operation) do {
    case "add": {
        _args params ["_text", ["_path", []]];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbAdd _text
            };
            case 102: { // CT_LISTNBOX  
                _control lnbAddRow ["", _text, "0"]
            };
            case 12: { // CT_TREE
                private _index = _control tvAdd [_path, _text];
                // Return the full path for tree controls
                _path + [_index]
            };
            default { -1 };
        };
    };
    
    case "clear": {
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                lbClear _control;
            };
            case 102: { // CT_LISTNBOX
                lnbClear _control;
            };
            case 12: { // CT_TREE
                tvClear _control;
            };
        };
    };
    
    case "setData": {
        _args params ["_index", "_data"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetData [_index, _data];
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetData [[_index, 0], _data];
            };
            case 12: { // CT_TREE
                // _index is already an array path for tree controls
                _control tvSetData [_index, _data];
            };
        };
    };
    
    case "getData": {
        _args params ["_index"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbData _index
            };
            case 102: { // CT_LISTNBOX
                _control lnbData [_index, 0]
            };
            case 12: { // CT_TREE
                _control tvData _index
            };
            default { "" };
        };
    };
    
    case "setPicture": {
        _args params ["_index", "_picture"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetPicture [_index, _picture];
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetPicture [[_index, 0], _picture];
            };
            case 12: { // CT_TREE
                // _index is already an array path for tree controls
                _control tvSetPicture [_index, _picture];
            };
        };
    };
    
    case "setPictureRight": {
        _args params ["_index", "_picture"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetPictureRight [_index, _picture];
            };
            case 102: { // CT_LISTNBOX
                // Listnbox doesn't have setPictureRight, skip
            };
            case 12: { // CT_TREE
                // _index is already an array path for tree controls
                _control tvSetPictureRight [_index, _picture];
            };
        };
    };
    
    case "setTooltip": {
        _args params ["_index", "_tooltip"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetTooltip [_index, _tooltip];
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetTooltip [[_index, 0], _tooltip];
            };
            case 12: { // CT_TREE
                // _index is already an array path for tree controls
                _control tvSetTooltip [_index, _tooltip];
            };
        };
    };
    
    case "setCurSel": {
        _args params ["_index"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetCurSel _index;
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetCurSelRow _index;
            };
            case 12: { // CT_TREE
                _control tvSetCurSel _index;
            };
        };
    };
    
    case "getCurSel": {
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                lbCurSel _control
            };
            case 102: { // CT_LISTNBOX
                lnbCurSelRow _control
            };
            case 12: { // CT_TREE
                tvCurSel _control
            };
            default { -1 };
        };
    };
    
    case "count": {
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                lbSize _control
            };
            case 102: { // CT_LISTNBOX
                (lnbSize _control) select 0
            };
            case 12: { // CT_TREE
                _control tvCount []
            };
            default { 0 };
        };
    };
    
    case "setColor": {
        _args params ["_index", "_color"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetColor [_index, _color];
                _control lbSetSelectColor [_index, _color];
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetColor [[_index, 1], _color];
                _control lnbSetColorRight [[_index, 1], _color];
            };
            case 12: { // CT_TREE
                // _index is already an array path for tree controls
                _control tvSetPictureColor [_index, _color];
            };
        };
    };
    
    case "setValue": {
        _args params ["_index", "_value"];
        
        switch (_controlType) do {
            case 5: { // CT_LISTBOX
                _control lbSetValue [_index, _value];
            };
            case 102: { // CT_LISTNBOX
                _control lnbSetValue [[_index, 2], _value];
            };
            case 12: { // CT_TREE
                // Tree controls don't have setValue, use setData for metadata
                _control tvSetData [_index, str _value];
            };
        };
    };
    
    default { 
        nil 
    };
};
