FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://init-install-efi-mender.sh"

do_install_append() {
    # Overwrite the version of this file provided by upstream
    sed -ie 's#[@]MENDER_STORAGE_DEVICE[@]#${MENDER_STORAGE_DEVICE}#' ${WORKDIR}/init-install-efi-mender.sh
    install -m 0755 ${WORKDIR}/init-install-efi-mender.sh ${D}/init.d/install-efi.sh
}
