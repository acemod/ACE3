#include "script_component.hpp"
#define BCSVER	QUOTE(0.1)
#define __arty_vec_lerp COMPILE_FILE2(\ca\modules\ARTY\data\scripts\ARTY_vec_lerp.sqf)



ADDON = false;
// actual work goes here
PREP(startBCS);
PREP(calcBallistics);
PREP(calcFiringSolution);
PREP(getBTable);
PREP(firingSolution);
PREP(formattedBTab);
PREP(switchMenu);
PREP(bcsUnload);
PREP(bcsLoad);
PREP(startMission);
PREP(parseGrid);
PREP(doCompute);
PREP(validateData);
PREP(validateTextField);
PREP(generateSolutions);
PREP(doFFE);
PREP(initMainScreen);
PREP(initMissionScreen);
PREP(populateObserverList);
PREP(returnMainScreen);
PREP(ammoSelectChange);
PREP(setFuzeSelection);
PREP(setFuzeSelectionMission);
PREP(loopRestoreControls);
PREP(bcsLog);
PREP(bcsLogWarn);
PREP(bcsLogError);
PREP(loopSaveControls);
PREP(ffeBack);
PREP(formatFireCommands);
PREP(modifyObserver);
PREP(simpleBallistics);
PREP(populateKnownPointList);
PREP(selectObserver);
PREP(selectKnownPoint);
PREP(modifyKnownPoint);
PREP(loopResetControls);
PREP(callShot);
PREP(doAdjustment);
PREP(initAdjust);
PREP(doComputeAdjust);
PREP(endMission);
PREP(openMap);
PREP(adjustBack);
PREP(cycleRadio);
PREP(openRadio);


BIS_ARTY_VEC_LERP = __arty_vec_lerp;
GVAR(currentState) = [];
GVAR(currentScreen) = MAIN_ID;
GVAR(validateError) = false;
GVAR(missionCount) = 0;
GVAR(adjustCount) = 0;
GVAR(missionComputed) = false;
GVAR(openingMap) = false;
GVAR(countDown) = false;

ADDON = true;
