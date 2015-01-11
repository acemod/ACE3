//Written by beta
//Open/close the ballistic computer


#include "defines.inc"

if (isNull (findDisplay BALLCOMP_IDD)) then {
	createDialog "bArty_BallCompRsc";
}
else {
	closeDialog 0;
};
