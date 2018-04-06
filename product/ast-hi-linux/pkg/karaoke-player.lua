return {
    source = {
        type     = 'hg',
        location = 'ssh://hg@bitbucket.org/art-system/karaoke-player',
    },
    build = {
        type = 'cmake'
    },
    requires = {
        'cmake-modules'
    },
    uses = 'hi-sdk'
}
