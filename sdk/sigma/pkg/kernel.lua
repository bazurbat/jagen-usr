return {
    source = {
        location = 'git@bitbucket.org:bazurbat/sigma-kernel.git',
        name     = 'sigma-kernel',
        branch   = 'sigma-2.6'
    },
    build = {
        type = 'kbuild',
        in_source = true,
        release = '2.6.32.15-21-sigma'
    },
    env = {
        LINUX_KERNEL = '$pkg_source_dir/linux'
    },
    uses = { 'ezboot', 'rootfs', 'xsdk' },
    export = {
        release = '$pkg_build_release',
        env = {
            -- for external modules
            KERNEL_SRC     = '$LINUX_KERNEL',
            -- for mrua
            UCLINUX_KERNEL = '$LINUX_KERNEL',
        }
    }
}
