#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the track key being held down.
 * Tracks change in direction of weapon and computes angle change per second.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nlaw_fnc_keyDown
 *
 * Public: No
 */

params ["_key", "_down"];
playSound "ACE_Sound_Click";
private _shooter = vehicle player;
private _return = false;

switch (_key) do {

    case 1: {
        _return = true;
    }; //MF key 1
    
    case 2: {
        _return = true;
    }; //MF key 2
    
    case 3: {
        private _inputs = _shooter getVariable [QGVAR(MCLOSInputs),[0,0]];
        if(_down) then {
            _inputs = [(((_inputs select 0)) min 1) max -1, (((_inputs select 1) + 1) min 1) max -1];
        } else {
            _inputs = [(((_inputs select 0)) min 1) max -1, (((_inputs select 1) - 1) min 1) max -1];
        };
        _shooter setVariable [QGVAR(MCLOSInputs), _inputs];
        _return = true;
    }; //Up
    
    case 4: {
        private _inputs = _shooter getVariable [QGVAR(MCLOSInputs),[0,0]];
        if(_down) then {
            _inputs = [(((_inputs select 0) - 1) min 1) max -1, (((_inputs select 1)) min 1) max -1];
        } else {
            _inputs = [(((_inputs select 0) + 1) min 1) max -1, (((_inputs select 1)) min 1) max -1];
        };
        _shooter setVariable [QGVAR(MCLOSInputs), _inputs];
        _return = true;
    }; //Left
    
    case 5: {
        private _inputs = _shooter getVariable [QGVAR(MCLOSInputs),[0,0]];
        if(_down) then {
            _inputs = [(((_inputs select 0) + 1) min 1) max -1, (((_inputs select 1)) min 1) max -1];
        } else {
            _inputs = [(((_inputs select 0) - 1) min 1) max -1, (((_inputs select 1)) min 1) max -1];
        };
        _shooter setVariable [QGVAR(MCLOSInputs), _inputs];
        _return = true;
    }; //Right
    
    case 6: {
        private _inputs = _shooter getVariable [QGVAR(MCLOSInputs),[0,0]];
        if(_down) then {
            _inputs = [(((_inputs select 0)) min 1) max -1, (((_inputs select 1) - 1) min 1) max -1];
        } else {
            _inputs = [(((_inputs select 0)) min 1) max -1, (((_inputs select 1) + 1) min 1) max -1];
        };
        _shooter setVariable [QGVAR(MCLOSInputs), _inputs];
        _return = true;
    }; //Down

};
_return;
