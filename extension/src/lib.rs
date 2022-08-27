use arma_rs::{arma, Extension};

pub mod ballistics;
mod clipboard;
mod common;

#[arma]
fn init() -> Extension {
    Extension::build()
        .group("ballistics", ballistics::group())
        .group("clipboard", clipboard::group())
        .finish()
}
