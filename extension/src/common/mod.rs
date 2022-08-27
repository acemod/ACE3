mod vector3;
pub use vector3::Vector3;

mod temperature;
pub use temperature::Temperature;

pub const GRAVITY: f64 = 9.80665;
pub const GRAVITY_ACCEL: Vector3 = Vector3::new(0.0, 0.0, -GRAVITY);
