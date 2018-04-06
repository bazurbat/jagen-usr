return {
    source = {
        type     = 'git',
        location = 'git@bitbucket.org:art-system/rootfs.git',
    },
    build = {
        type = true,
        dir = '$jagen_target_dir'
    },
    uses = 'hi-sdk'
}
