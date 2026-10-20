use std::collections::HashMap;

use arma_rs::Group;

mod model;
pub use model::Map;

pub fn group() -> Group {
    Group::new().command("init", init).command("set", set)
}

pub static mut MAPS: Option<HashMap<String, Map>> = None;
pub static mut CURRENT_MAP: Option<String> = None;

/// Initializes a new map, and sets it as the current map
///
/// Safety: Arma will only call this from its main thread
fn init(name: String, size: u32) -> bool {
    unsafe {
        if MAPS.is_none() {
            MAPS = Some(HashMap::new());
        }
        CURRENT_MAP = Some(name.clone());
        if MAPS.as_ref().unwrap().contains_key(&name) {
            return true;
        }
        MAPS.as_mut()
            .unwrap()
            .insert(name, Map::new(size, (size / 50) + 1));
    }
    false
}

/// Sets the height, number of objects, and surface type of a grid square
///
/// Safety: Arma will only call this from its main thread
fn set(grid: u64, height: i64, num_objects: i64, surface_is_water: bool) -> Result<(), String> {
    unsafe {
        MAPS.as_mut()
            .ok_or_else(|| "Map array not initialized".to_string())?
            .get_mut(
                CURRENT_MAP
                    .as_ref()
                    .ok_or_else(|| "No current map".to_string())?,
            )
            .map_or_else(
                || Err(format!("no map: {}", CURRENT_MAP.as_ref().unwrap())),
                |map| {
                    map.set_height(grid as usize, height);
                    map.set_building_num(grid as usize, num_objects);
                    map.set_surface_is_water(grid as usize, surface_is_water);
                    Ok(())
                },
            )
    }
}
