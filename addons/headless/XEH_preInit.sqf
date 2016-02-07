#include "script_component.hpp"

ADDON = false;

PREP(handleConnectHC);
PREP(handleDisconnect);
PREP(handleInitPost);
PREP(moduleInit);
PREP(rebalance);
PREP(transferGroups);

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    ["ACE_HeadlessClientJoined", FUNC(handleConnectHC)] call EFUNC(common,addEventHandler);
};

ADDON = true;
