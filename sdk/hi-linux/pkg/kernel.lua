return {
    source = {
        location = 'git@bitbucket.org:bazurbat/hi-kernel.git',
        name     = 'hi-kernel'
    },
    build = {
        type = 'linux-kernel',
        image = 'uImage',
        config = 'ast2xx_hi3719cv100_defconfig',
        in_source = true,
    },
    export = {
        env = {
            KERNEL_SRC = '$pkg_source_dir'
        }
    }
}
