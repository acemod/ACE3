#define CN_SOUND(base,dur) QUOTE(TRIPLES(ADDON,base,dur))

class GVAR(base) {
    // Possible variants this item can be turned into
    // Subclasses can contain optional directionalActionName property to use as display name for the action.
    class modifiableTo { };

    // Components the current variant contains within itself
    components[] = {};

    // CfgSound entries, to be chosen by random when the action is performed
    sound[] = {CN_SOUND(fabric,06), CN_SOUND(fabric,07), CN_SOUND(fabric,16), CN_SOUND(fabric,20), CN_SOUND(fabric,25)};
    // Defines the point in time relative to the duration when the sound is played, ranging from 0 to 1:
    //   0 at the start of the action
    //   0.5 half way during the duration of the action - always, if completed or not
    //   1 at the end, only when completed
    sound_timing = 0;

    // Gesture to be played when the action is performed
    gesture = "Gear";

    // Will be used instead of target variant picture
    alternativePicture = "";
    // Will be used instead of the target variants displayname
    alternativeActionName = "";

    // Duration of action. Minimum value of 1 - anything above will produce a progressbar
    duration = 1;

    // Fallback for components that are not present within the same mod/addon
    fallbackComponent = "";
};

// Common base class for uniforms with sleeves up/down variants
class GVAR(base_U_sleeves_up): GVAR(base) {
    alternativeActionName = CSTRING(sleevesUp);
};
class GVAR(base_U_sleeves_down): GVAR(base) {
    alternativeActionName = CSTRING(sleevesDown);
};

// Common base class for uniforms with gloves on/off variants
class GVAR(base_U_gloves_on): GVAR(base) {
    alternativeActionName = CSTRING(glovesOn);
};
class GVAR(base_U_gloves_off): GVAR(base) {
    alternativeActionName = CSTRING(glovesOff);
};

// Common base class for uniforms who are open/closed in the front
class GVAR(base_U_jacket_open): GVAR(base) {
    alternativeActionName = CSTRING(jacketOpen);
};
class GVAR(base_U_jacket_closed): GVAR(base) {
    alternativeActionName = CSTRING(jacketClose);
};

// Common base class for helmets with a visor that can be flipped up or down
class GVAR(base_H_visor_up): GVAR(base) {
    duration = 0.25;
    gesture = "gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeActionName = CSTRING(visorUp);
};

class GVAR(base_H_visor_down): GVAR(base) {
    duration = 0.25;
    gesture = "gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeActionName = CSTRING(visorDown);
};

// Common base class for headgear with goggles that can be used as a facewear item
class GVAR(base_H_goggles_on): GVAR(base) {
    gesture = "GestureWipeFace";
    alternativeActionName = CSTRING(gogglesOn);
};

class GVAR(base_H_goggles_off): GVAR(base) {
    gesture = "GestureWipeFace";
    alternativeActionName = CSTRING(gogglesOff);
};


// Common base class for headgear with a mask on/off variant
class GVAR(base_H_mask_on): GVAR(base) {
    gesture = "GestureWipeFace";
    alternativeActionName = CSTRING(maskOn);
};

class GVAR(base_H_mask_off): GVAR(base) {
    gesture = "GestureWipeFace";
    alternativeActionName = CSTRING(maskOff);
};
