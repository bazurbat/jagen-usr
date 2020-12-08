return {
    source = {
        location = 'git@bitbucket.org:bazurbat/sigma-ezboot.git',
        name     = 'sigma-ezboot',
        branch   = 'sdk4'
    },
    build = {
        type = 'sigma',
        in_source = true
    },
    uses = { 'rootfs', 'xsdk' }
}
