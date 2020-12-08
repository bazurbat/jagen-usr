local pkg = {
    source = {
        location = 'git@bitbucket.org:bazurbat/chicken-scheme.git',
        name     = 'chicken-scheme',
        branch   = 'release-cmake'
    },
    build = {
        type = 'cmake'
    }
}

if Jagen.flag('new_chicken') then
    pkg.source.branch = 'master-cmake'
end

return pkg
