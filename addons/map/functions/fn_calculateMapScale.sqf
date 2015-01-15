/*
 * Author: CAA-Picard
 *
 * Returns the equivalent of 100m in screen coordinates
 *
 * Argument:
 * None
 *
 * Return value:
 * Return
 */

_pos          = ((finddisplay 12) displayctrl 51) ctrlMapScreenToWorld [0.5, 0.5];
_screenOffset = ((finddisplay 12) displayctrl 51) posWorldToScreen [(_pos select 0) + 100, (_pos select 1)];

(_screenOffset select 0) - 0.5
