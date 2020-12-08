return {
    source = {
        type      = 'dist',
        location  = 'https://github.com/libexpat/libexpat/releases/download/R_2_1_0/expat-2.1.0.tar.gz',
        sha256sum = '823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86'
    },
    build  = {
        type = 'gnu',
    },
    install = {
        libs = { 'expat' }
    }
}
