/**
 * fn_isOpenSecondRing_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define OPTION_BOTTOM_LEFT_ONE 		300
#define OPTION_BOTTOM_LEFT_TWO 		301
#define OPTION_BOTTOM_LEFT_THREE 	302
#define OPTION_TOP_LEFT_ONE 		303
#define OPTION_TOP_LEFT_TWO 		304
#define OPTION_TOP_LEFT_THREE 		305
#define OPTION_TOP_RIGHT_ONE 		306
#define OPTION_TOP_RIGHT_TWO 		307
#define OPTION_TOP_RIGHT_THREE 		308
#define OPTION_BOTTOM_RIGHT_ONE 	309
#define OPTION_BOTTOM_RIGHT_TWO 	310
#define OPTION_BOTTOM_RIGHT_THREE 	311


private ["_return", "_availableOptionSpots"];
_availableOptionSpots = [OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE, OPTION_TOP_LEFT_ONE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE];

_return = false;
{
	if (ctrlEnabled _x) exitwith {
		_return = true;
	};
}foreach _availableOptionSpots;

_return