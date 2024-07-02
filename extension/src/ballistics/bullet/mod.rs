use std::collections::HashMap;

use arma_rs::Group;
use uuid::Uuid;

use super::{
    atmosphere::AtmosphereModel,
    drag::DragFunction,
    map::{CURRENT_MAP, MAPS},
};
use crate::common::{Temperature, Vector3};

mod model;
pub use model::Bullet;

pub fn group() -> Group {
    Group::new()
        .command("new", new)
        .command("simulate", simulate)
        .command("delete", delete)
}

static mut BULLET_LIST: Option<HashMap<String, Bullet>> = None;

#[allow(clippy::too_many_arguments)]
/// Create a new bullet and return its UUID.
fn new(
    ammo_count: u64,
    air_friction: f64,
    ballistic_coefficients: Vec<f64>,
    velocity_boundaries: Vec<f64>,
    atmosphere_model: AtmosphereModel,
    drag_function: DragFunction,
    stability_factor: f64,
    twist_direction: f64,
    transonic_stability_coefficient: f64,
    origin: Vector3,
    bullet_velocity: Vector3,
    latitude: f64,
    temperature: Temperature,
    altitude: f64,
    humidity: f64,
    overcast: f64,
    start_time: f64,
) -> Uuid {
    let id = Uuid::new_v4();
    let bullet = Bullet {
        air_friction,
        bullet_caliber: 0.0,
        bullet_length: 0.0,
        bullet_mass: 0.0,
        ballistic_coefficients,
        velocity_boundaries,
        atmosphere_model,
        drag_function,
        muzzle_velocities: vec![0.0, 0.0],
        barrel_length: 0.0,
        stability_factor,
        twist_direction,
        transonic_stability_coefficient,
        bullet_velocity_last_frame: bullet_velocity,
        origin,
        latitude: latitude / 180.0 * std::f64::consts::PI,
        temperature,
        altitude,
        humidity,
        overcast,
        start_time,
        last_frame: start_time,
        rng: rand::SeedableRng::seed_from_u64({
            let k1 = (start_time / 2.0).round();
            let k2 = ammo_count as f64;
            (0.5 * (k1 + k2)).mul_add(k1 + k2 + 1.0, k2) as u64
        }),
    };
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        if BULLET_LIST.is_none() {
            BULLET_LIST = Some(HashMap::new());
        }
        BULLET_LIST.as_mut().unwrap().insert(id.to_string(), bullet);
    }
    id
}

/// Simulate a bullet for a given time. Returns the velocity
fn simulate(
    id: String,
    bullet_velocity: Vector3,
    bullet_position: Vector3,
    wind: Vector3,
    altitude: f64,
    time: f64,
) -> Result<Vector3, String> {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        MAPS.as_ref().map_or_else(
            || Err("No map loaded".to_string()),
            |map| {
                let bullet = {
                    if BULLET_LIST.is_none() {
                        BULLET_LIST = Some(HashMap::new());
                    }
                    BULLET_LIST
                        .as_mut()
                        .unwrap()
                        .get_mut(&id)
                        .ok_or_else(|| "Bullet not found".to_string())?
                };
                Ok(bullet.simulate(
                    map.get(
                        CURRENT_MAP
                            .as_ref()
                            .ok_or_else(|| "No current map".to_string())?,
                    )
                    .ok_or_else(|| "Current map not loaded".to_string())?,
                    bullet_velocity,
                    bullet_position,
                    wind,
                    altitude,
                    time,
                ))
            },
        )
    }
}

/// Delete a bullet
/// Returns true if the bullet was found and deleted
fn delete(id: String) -> bool {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        if BULLET_LIST.is_none() {
            BULLET_LIST = Some(HashMap::new());
        }
        BULLET_LIST.as_mut().unwrap().remove(&id).is_some()
    }
}
