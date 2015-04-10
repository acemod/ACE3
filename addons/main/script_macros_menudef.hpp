// ACE Self Interaction Conditions

// Self Interaction Menu not available if player is unconscious
#define ACE_INTERACT_ALIVE (alive player)
#define ACE_INTERACT_UNCON (player call ace_wounds_fnc_isUncon)

// Player is Player Vehicle
#define ACE_INTERACT_PLAYER (player == vehicle player || (player != vehicle player && player in assignedCargo vehicle player))

// Player is climbing up a ladder
#define ACE_INTERACT_LADDER (animationState player in ["ladderriflestatic","laddercivilstatic"])

// Possible = Self interaction opens only if player is alive and conscious (can be in a vehicle)
#define ACE_SELFINTERACTION_POSSIBLE (!ACE_INTERACT_LADDER && {ACE_INTERACT_ALIVE} && {!ACE_INTERACT_UNCON})

// Restricted = Self interaction opens only if player is alive and conscious (can NOT be in a vehicle, i.e Groundmarker, explosives ...)
#define ACE_SELFINTERACTION_RESTRICTED (ACE_SELFINTERACTION_POSSIBLE && {ACE_INTERACT_PLAYER})

// Close interaction menu if unconscious
#define ACE_INTERACT_FNC_EXIT if (ACE_INTERACT_UNCON) exitWith {}
#define ACE_ASSEMBLE (getNumber(configFile >> "CfgActions" >> "Assemble" >> "show") == 0)
#define ACE_DISASSEMBLE (getNumber(configFile >> "CfgActions" >> "DisAssemble" >> "show") == 0)
#define ACE_PIPEDEFAULT (getNumber(configFile >> "CfgMagazines" >> "PipeBomb" >> "useAction") == 0)
#define ACE_IDENTITYDEFAULT (isClass(configFile >> "CfgPatches" >> "ace_combatdeaf"))
#define ACE_RUCKDEFAULT (isClass(configFile >> "CfgPatches" >> "ace_stamina"))

#define ACE_KNOWN2PLAYER (if (name _target in (player getVariable ["ace_recognize_knownnames",[]])) then { name _target } else { " " })