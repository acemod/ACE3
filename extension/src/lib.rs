#![deny(clippy::all)]
#![deny(missing_debug_implementations)]

//! ACE3 Extension for quick maths and OS APIs

use arma_rs::{arma, Extension};

mod artillery;
pub mod ballistics;
mod break_line;
mod clipboard;
mod common;
mod fcs;

#[arma]
fn init() -> Extension {
    Extension::build()
        .group("artillery", artillery::group())
        .group("ballistics", ballistics::group())
        .group("clipboard", clipboard::group())
        .command("break_line", break_line::break_line)
        .command("fcs", fcs::get_solution)
        .finish()
}
