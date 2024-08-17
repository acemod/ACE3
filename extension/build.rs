fn main() {
    let repo = git2::Repository::open("../").expect("Open git repo");
    let head = repo
        .head()
        .expect("Get HEAD")
        .target()
        .expect("Get HEAD target");
    let commit = repo.find_commit(head).expect("Find commit");
    println!("cargo:rustc-env=GIT_HASH={}", commit.id());
}
