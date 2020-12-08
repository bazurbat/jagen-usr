return {
    source = {
        location = 'git@bitbucket.org:bazurbat/karaoke-player.git',
        branch   = 'hisi'
    },
    build = {
        type = 'cmake'
    },
    requires = {
        'cmake-modules'
    },
    uses = 'hi-sdk'
}
