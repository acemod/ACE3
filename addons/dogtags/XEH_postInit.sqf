#include "script_component.hpp"

[QGVAR(showDogtag), DFUNC(showDogtag)] call EFUNC(common,addEventHandler);
[QGVAR(sendDogtagData), DFUNC(sendDogtagData)] call EFUNC(common,addEventHandler);
[QGVAR(getDogtagItem), DFUNC(getDogtagItem)] call EFUNC(common,addEventHandler);
[QGVAR(addDogtagItem), DFUNC(addDogtagItem)] call EFUNC(common,addEventHandler);
