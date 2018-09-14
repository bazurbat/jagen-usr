return {
    source = {
        type     = 'git',
        location = 'git@bitbucket.org:art-system/sigma-ezboot.git',
        name     = 'sigma-ezboot',
        branch   = 'sdk4'
    },
    build = {
        type = 'sigma',
        in_source = true
    },
    uses = { 'rootfs', 'xsdk' }
}
