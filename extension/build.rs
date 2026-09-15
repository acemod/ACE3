fn main() {
    if let Ok(repo) = git2::Repository::open("../") {
        let head = repo
            .head()
            .expect("Get HEAD")
            .target()
            .expect("Get HEAD target");
        let commit = repo.find_commit(head).expect("Find commit");
        println!("cargo:rustc-env=GIT_HASH={}", commit.id());
    } else {
        println!("cargo:rustc-env=GIT_HASH=GIT_REPO_FAILURE");
    }
}
