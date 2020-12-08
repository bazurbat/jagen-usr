return {
    source = {
        location = 'git@bitbucket.org:bazurbat/sigma-rootfs.git',
        name     = 'sigma-rootfs'
    },
    build = {
        type = 'make',
        in_source = true,
        unset_cflags = true,
        jobs = 1
    },
    export = {
        root = '$pkg_source_dir/build_mipsel/root',
        prefix = '$pkg_source_dir/cross_rootfs',
        env = {
            SMP86XX_ROOTFS_PATH = '$pkg_source_dir',
            INSTALL_MOD_PATH = '$pkg_export_root'
        }
    }
}
