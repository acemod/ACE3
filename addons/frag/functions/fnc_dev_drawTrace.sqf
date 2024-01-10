#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Per frame function to draw all dev traces 
 *
 * Arguments:
 * none
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */

private _deleteArr = [];
{
    // leave if trace is not to be drawn
    if (count (_y#1) > 1) then
    {
        for "_j" from 1 to count (_y#1) - 1 do
        {
            drawLine3D [_y#1#(_j-1), _y#1#_j, _y#2];
        };
    };			
} forEach GVAR(dev_trackLines);

if (GVAR(drawHitBox)) then {
    
    #define HB_DRAW_ARRS [[3,2,1,5,6,7,3,0,4,5],[0,1],[2,6],[7,4]]
    _deleteArr = [];
    {
        _y params ["_obj", "_pts", "_color"];
        if (!alive _obj) then
        {
            _deleteArr pushBack _x;
            continue;
        };
        
        {
            for "_i" from 1 to count _x -1 do
            {
                drawLine3D [_obj modelToWorld (_pts#(_x#_i)), _obj modelToWorld (_pts#(_x#(_i-1))), _color];				
            };
        } forEach HB_DRAW_ARRS;

    } forEach GVAR(dev_hitBoxes);
    
    for "_i" from 0 to count _deleteArr - 1 do
    {
        GVAR(dev_hitBoxes) deleteAt (_deleteArr#_i);
    };
};