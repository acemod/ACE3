#define CN_SOUND(base,dur) QUOTE(TRIPLES(ADDON,base,dur))

class GVAR(base) {
    // Possible variants this item can be turned into
    // Subclasses can contain optional directional properties, see documentation for details.
    class modifiableTo { };

    // Components the current variant contains within itself
    components[] = { };

    // CfgSound entries, to be chosen by random when the action is performed
    sound[] = { CN_SOUND(fabric,06), CN_SOUND(fabric,07), CN_SOUND(fabric,16), CN_SOUND(fabric,20), CN_SOUND(fabric,25) };
    // Defines the point in time relative to the duration when the sound is played, ranging from 0 to 1:
    //   0 at the start of the action
    //   0.5 half way during the duration of the action - always, if completed or not
    //   1 at the end, only when completed
    soundTiming = 0;

    // Gesture to be played when the action is performed
    gesture = "Gear";

    // Will be used instead of target variant picture
    icon = "";

    // Will be used instead of the target variants displayname
    displayName = "";

    // Duration of action. Minimum value of 1 - anything above will produce a progressbar
    duration = 1;

    // Fallback for components that are not present within the same mod/addon
    fallbackComponent = "";
};

// Common base class for uniforms with sleeves up/down variants
class GVAR(base_U_sleeves_up): GVAR(base) {
    displayName = CSTRING(sleevesUp);
};
class GVAR(base_U_sleeves_down): GVAR(base) {
    displayName = CSTRING(sleevesDown);
};

// Common base class for uniforms with gloves on/off variants
class GVAR(base_U_gloves_on): GVAR(base) {
    displayName = CSTRING(glovesOn);
};
class GVAR(base_U_gloves_off): GVAR(base) {
    displayName = CSTRING(glovesOff);
};

// Common base class for uniforms with ties on/off variants
class GVAR(base_U_tie_on): GVAR(base) {
    displayName = CSTRING(tieOn);
};
class GVAR(base_U_tie_off): GVAR(base) {
    displayName = CSTRING(tieOff);
};

// Common base class for uniforms who are open/closed in the front
class GVAR(base_U_jacket_open): GVAR(base) {
    displayName = CSTRING(jacketOpen);
};
class GVAR(base_U_jacket_closed): GVAR(base) {
    displayName = CSTRING(jacketClose);
};
// Common base class for uniforms with an raised or lowered hood
class GVAR(base_U_hood_raised): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(hoodRaise);
};
class GVAR(base_U_hood_lowered): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(hoodLower);
};

// Common base class for helmets with a visor that can be flipped up or down
class GVAR(base_H_visor_up): GVAR(base) {
    duration = 0.25;
    gesture = "gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    soundTiming = 0;

    displayName = CSTRING(visorUp);
};

class GVAR(base_H_visor_down): GVAR(base) {
    duration = 0.25;
    gesture = "gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    soundTiming = 0;

    displayName = CSTRING(visorDown);
};

// Common base class for headgear with goggles that can be used as a facewear item
class GVAR(base_H_goggles_on): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(gogglesOn);
};

class GVAR(base_H_goggles_off): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(gogglesOff);
};


// Common base class for headgear with a mask on/off variant
class GVAR(base_H_mask_on): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(maskOn);
};

class GVAR(base_H_mask_off): GVAR(base) {
    gesture = "GestureWipeFace";
    displayName = CSTRING(maskOff);
};
