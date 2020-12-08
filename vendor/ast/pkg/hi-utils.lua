return {
    source = {
        location = 'git@bitbucket.org:bazurbat/hi-utils.git'
    },
    build = {
        type = 'cmake'
    },
    requires = {
        'cmake-modules',
        'glib',
        'hi-sdk',
    },
    uses = 'hi-sdk'
}
