return {
    source = {
        location = 'git@bitbucket.org:bazurbat/chicken-eggs.git',
        branch   = 'release'
    },
    build = {
        type = 'cmake'
    },
    requires = { 'chicken' }
}
