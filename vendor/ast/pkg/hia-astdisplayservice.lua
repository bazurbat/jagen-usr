return {
    source = {
        location = 'git@bitbucket.org:bazurbat/hia-astdisplayservice.git',
    },
    build = {
        type = 'cmake'
    },
    requires = {
        'karaoke-player'
    },
    uses = 'hi-sdk'
}
