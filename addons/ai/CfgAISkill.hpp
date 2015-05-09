
/*
 * Documentation:
 * https://community.bistudio.com/wiki/AI_Sub-skills
 *
 * The idea here is to reduce the AI's godlike aiming
 * capabilties while retaining it's high intelligence.
 * The AI should be smart enough to move through a town,
 * but also be 'human' in their reaction time and aim.
 *
 * Note: All these values can still be adjusted via
 *       scripts, these arrays just change what 0 & 1
 *       are for setSkill.
 */

class CfgAISkill {
    aimingAccuracy[] = {0,0, 1,0.8};  // {0,0,1,1};   v1.26 defaults
    aimingShake[]    = {0,0, 1,0.6};  // {0,0,1,1};
    aimingSpeed[]    = {0,0, 1,0.7};  // {0,0.5,1,1};
    commanding[]     = {0,0, 1,0.8};  // {0,0,1,1};
    courage[]        = {0,0, 1,0.7};  // {0,0,1,1};
    endurance[]      = {0,0, 1,0.7};  // {0,0,1,1};
    general[]        = {0,0, 1,0.9};  // {0,0,1,1};
    // apparently breaks rapid firing in single fire mode for players
    //reloadSpeed[]    = {0,0, 1,0.8};  // {0,0,1,1};
    spotDistance[]   = {0,0, 1,0.9};  // {0,0.2,1,0.4};
    spotTime[]       = {0,0, 1,0.7};  // {0,0,1,0.7};
};
