#include "script_component.hpp"

ADDON = false;

// interaction menu
PREP(addPassengerActions)
PREP(addPassengersActions);
PREP(getWeaponPos);
PREP(moduleInteraction);
PREP(removeTag);

// scroll wheel hint
PREP(showMouseHint);
PREP(hideMouseHint);

// interaction with units
PREP(canInteractWithCivilian);
PREP(getDown);
PREP(sendAway);
PREP(canJoinGroup);
PREP(canJoinTeam);
PREP(joinTeam);
PREP(canBecomeLeader);
PREP(doBecomeLeader);
PREP(canTapShoulder);
PREP(tapShoulder);
PREP(canPardon);
PREP(pardon);

// interaction with doors
PREP(getDoor);
PREP(getDoorAnimations);
PREP(openDoor);

// interaction with boats
PREP(push);

ADDON = true;
