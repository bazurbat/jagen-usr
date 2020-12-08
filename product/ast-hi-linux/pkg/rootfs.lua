return {
    source = {
        location = 'git@bitbucket.org:bazurbat/ast-rootfs.git',
        name     = 'rootfs'
    },
    build = {
        type = true,
        dir = '$jagen_target_dir'
    },
    uses = 'hi-sdk'
}
