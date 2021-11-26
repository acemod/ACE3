---
layout: wiki
title: Dependencies
description: This page details each component and its required addons.
group: development
parent: wiki
order: 0
---

This page details each component and the addons it requires.

## 1. Removing a component.
Any component you wish to remove must also remove any component which requires it.

Example:  
To remove `ace_ai` you must also remove `ace_zeus`.

Because `ace_zeus` is being removed you must also then remove any components that requires `ace_zeus` which in this case would be `ace_intelitems`

## 2. Dependency list.
### Advanced Ballistics
- `ace_ballistics`
- `ace_weather`

### Advanced Fatigue
- `ace_common`

### Advanced Throwing
- `ace_common`
- `ace_weaponselect`

### AI
- `ace_common`

### Aircraft
- `ace_common`

### APL
- `ace_main`

### Arsenal
- `ace_common`

### Artillery Tables
- `ace_interaction`

### AtragMX
- `ace_advanced_ballistics`
- `ace_common`
- `ace_weather`

### Attach
- `ace_interaction`

### Backpacks
- `ace_common`

### Ballistics
- `ace_common`

### Captives
- `ace_interaction`

### Cargo
- `ace_interaction`

### Chemlights
- `ace_common`

### Common
- `ace_main`
- `ace_modules`

### Concertina Wire
- `ace_apl`
- `ace_interaction`

### Cookoff
- `ace_common`

### CSW
- `ace_interaction`

### DAGR
- `ace_weather`

### Disarming
- `ace_interaction`

### Disposable
- `ace_common`

### Dogtags
- `ace_interaction`

### Dragging
- `ace_interaction`

### Dragon
- `ace_hot`
- `ace_csw`

### Explosives
- `ace_interaction`

### Fastroping
- `ace_interaction`
- `ace_logistics_rope`

### FCS
- `ace_interaction`

### Field Rations
- `ace_interact_menu`

### Finger
- `ace_common`

### Fire
- `ace_common`
- `ace_medical_engine`

### Flashlights
- `ace_interaction`

### Flash Suppressors
- `ace_common`

### Fonts
- `ace_main`

### Fortify
- `ace_interaction`

### Frag
- `ace_common`

### Gestures
- `ace_interact_menu`

### GForces
- `ace_common`

### Goggles
- `ace_common`

### Grenades
- `ace_common`

### Gunbag
- `ace_interaction`
- `ace_movement`

### Headless
- `ace_common`

### Hearing
- `ace_interaction`

### Hellfire
- `ace_interaction`
- `ace_missileguidance`

### Hit Reactions
- `ace_common`

### Hot
- `ace_common`
- `ace_missileguidance`

### Hunt IR
- `ace_common`

### Intel Items
- `ace_interact_menu`
- `ace_zeus`

### Interact Menu
- `ace_common`

### Interaction
- `ace_interact_menu`

### Inventory
- `ace_common`

### Javelin
- `ace_main`
- `ace_common`
- `ace_missileguidance`

### Kestrel 4500
- `ace_common`
- `ace_weather`

### Kill Tracker
- `ace_common`

### Laser
- `ace_common`

### Laser Pointer
- `ace_common`

### Logistics Rope
- `ace_common`

### Logistics UAV Battery
- `ace_interaction`

### Logistics Wirecutter
- `ace_interaction`

### Magazine Repack
- `ace_interaction`

### Main
- `cba_main`

### Map
- `ace_interaction`

### Map Gestures
- `ace_common`

### Map Tools
- `ace_interaction`

### Markers
- `ace_common`

### Maverick
- `ace_missileguidance`

### Medical
- `ace_medical_engine`

### Medical AI
- `ace_medical_treatment`

### Medical Blood
- `ace_medical_status`

### Medical Damage
- `ace_medical_engine`

### Medical Engine
- `ace_common`

### Medical Feedback
- `ace_medical_status`

### Medical GUI
- `ace_medical_treatment`
- `ace_interaction`

### Medical Statemachine
- `ace_medical_vitals`

### Medical Status
- `ace_medical_engine`

### Medical Treatment
- `ace_medical_status`
- `ace_medical_damage`
- `ace_apl`

### Medical Vitals
- `ace_medical_status`

### Metis
- `ace_missileguidance`

### MicroDAGR
- `ace_common`

### Mine Detector
- `ace_explosives`

### Missile Guidance
- `ace_laser`

### Mission Modules
- `ace_common`

### MK6 Mortar
- `ace_csw`
- `ace_artillerytables`

### Modules
- `ace_main`

### Movement
- `ace_common`

### MX2A
- `ace_apl`

### Nametags
- `ace_interaction`

### Night Vision
- `ace_common`

### NLAW
- `ace_missileguidance`

### No Idle
- `ace_common`

### No Radio
- `ace_common`

### No Rearm
- `ace_common`

### Optics
- `ace_common`

### Options Menu
- `ace_common`

### Overheating
- `ace_interaction`

### Overpressure
- `ace_common`

### Parachute
- `ace_common`

### Pylons
- `ace_interact_menu`

### Quick Mount
- `ace_common`

### Range Card
- `ace_advanced_ballistics`
- `ace_scopes`

### Realistic Names
- `ace_common`
- `ace_optics`

### Realistic Weights
- `ace_common`
- `ace_disposable`

### Rearm
- `ace_interaction`

### Recoil
- `ace_common`

### Refuel
- `ace_interaction`

### Reload
- `ace_interaction`

### Reload Launchers
- `ace_interaction`

### Repair
- `ace_interaction`

### Respawn
- `ace_common`

### Safemode
- `ace_common`

### Sandbag
- `ace_interaction`

### Scopes
- `ace_common`

### Sitting
- `ace_interaction`

### Slideshow
- `ace_common`

### Small Arms
- `ace_common`

### Spectator
- `ace_common`

### Spotting Scope
- `ace_apl`
- `ace_interaction`

### Switch Units
- `ace_common`

### Tactical Ladder
- `ace_apl`
- `ace_interaction`

### Tagging
- `ace_interaction`

### Thermals
- `ace_common`

### Towing
- `ace_common`
- `ace_logistics_rope`

### Trenches
- `ace_interaction`

### Tripod
- `ace_interaction`

### UI
- `ace_common`

### Vector
- `ace_common`

### Vehicle Damage
- `ace_common`
- `ace_cookoff`

### Vehicle Lock
- `ace_interaction`

### Vehicles
- `ace_common`

### View Distance
- `ace_common`

### View Restriction
- `ace_common`

### Volume
- `ace_common`

### Weapon Select
- `ace_common`

### Weather
- `ace_common`

### Wind Deflection
- `ace_common`

### Yardage 450
- `ace_apl`
- `ace_laser`

### Zeus
- `ace_common`
- `ace_ai`
