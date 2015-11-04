/*
 * Author: p1nga
 *
 * Init Aimingpost Post.
 *
 * Argument:
 * 0: Any object <OBJECT>
 * 1: true to enable carrying, false to disable <BOOL>
 * 2: Position offset for attachTo command <ARRAY> (default: [0,1,1])
 * 3: Direction in degree to rotate the object after attachTo <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
 
params ["_object"];

diag_log 'Aiming Post Intialized';
 
_object setVariable ["lightStatus", 0];

diag_log _object getVariable "lightStatus"; 
