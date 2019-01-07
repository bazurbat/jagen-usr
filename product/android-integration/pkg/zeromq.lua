return {
    source = {
        location = 'https://github.com/zeromq/libzmq.git',
        tag = 'v4.2.5'
    },
    build = {
        type = 'cmake',
        options = {
            '-DENABLE_DRAFTS=NO'
        }
    }
}
