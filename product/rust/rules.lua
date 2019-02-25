package { 'hello.default',
    build = 'rust'
}

package { 'hello.specific',
    build = {
        type = 'rust',
        rust_toolchain = '1.26.2'
    }
}

package { 'hello.musl',
    build = {
        type = 'rust',
        rust_toolchain = '1.26.2',
        system = 'x86_64-unknown-linux-musl'
    }
}

package { 'hello.android',
    build = {
        type = 'rust',
        toolchain = 'android-standalone-arm'
    }
}
