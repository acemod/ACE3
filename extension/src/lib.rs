#![deny(clippy::all)]
#![deny(missing_debug_implementations)]
#![allow(static_mut_refs)]

//! ACE3 Extension for quick maths and OS APIs

use arma_rs::{Extension, arma};

mod artillery;
mod ballistics;
mod break_line;
mod clipboard;
mod common;
mod fcs;
mod window;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version(env!("GIT_HASH").to_string())
        .group("artillery", artillery::group())
        .group("ballistics", ballistics::group())
        .group("clipboard", clipboard::group())
        .group("window", window::group())
        .command("break_line", break_line::break_line)
        .command("fcs", fcs::get_solution)
        .command("version", || env!("GIT_HASH"))
        .finish()
}
