use std::collections::HashMap;

use arma_rs::Group;

mod model;
pub use model::Map;

pub fn group() -> Group {
    Group::new().command("init", init).command("set", set)
}

pub static mut MAPS: Option<HashMap<String, Map>> = None;
pub static mut CURRENT_MAP: Option<String> = None;

fn init(name: String, size: u32) -> Result<bool, String> {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        if MAPS.is_none() {
            MAPS = Some(HashMap::new())
        }
        CURRENT_MAP = Some(name.clone());
        if MAPS.as_ref().unwrap().contains_key(&name) {
            return Ok(true);
        }
        MAPS.as_mut()
            .unwrap()
            .insert(name, Map::new(size, (size / 50) + 1));
    }
    Ok(false)
}

fn set(grid: u64, height: i64, num_objects: i64, surface_is_water: bool) {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        if MAPS.is_none() {
            return;
        }
        let map = MAPS.as_mut().unwrap().get_mut(&grid.to_string()).unwrap();
        map.set_height(grid as usize, height);
        map.set_building_num(grid as usize, num_objects);
        map.set_surface_is_water(grid as usize, surface_is_water);
    }
}
