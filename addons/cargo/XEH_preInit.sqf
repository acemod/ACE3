#include "script_component.hpp"

ADDON = false;

PREP(canLoadItem);
PREP(canLoadItemCarried);
//PREP(hasLoadedItems);
PREP(getLoadPoints);
PREP(remainingSpace);
PREP(loadItem);
PREP(openLoadUI);
PREP(loadItemCallback);
PREP(loadItemAbort);
PREP(initLoadedObject);
PREP(openUnloadUI);
PREP(unloadItem);
PREP(getChildrenUnloadActions);
PREP(unloadItemCallback);
PREP(getItemToLoad);

ADDON = true;
