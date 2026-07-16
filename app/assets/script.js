function konfirmasiHapus() {
    return confirm(
        "Apakah Anda yakin ingin menghapus data ini?"
    );
}


document.addEventListener(
    "DOMContentLoaded",
    function () {

        const form =
            document.getElementById(
                "formPraktikan"
            );

        if (form) {

            form.addEventListener(
                "submit",
                function (event) {

                    const inputWajib =
                        form.querySelectorAll(
                            "[required]"
                        );

                    for (
                        let i = 0;
                        i < inputWajib.length;
                        i++
                    ) {

                        if (
                            inputWajib[i]
                                .value
                                .trim() === ""
                        ) {

                            event.preventDefault();

                            alert(
                                "Semua data wajib harus diisi."
                            );

                            inputWajib[i].focus();

                            return;
                        }
                    }
                }
            );
        }


        const alertBox =
            document.querySelector(
                ".alert"
            );

        if (alertBox) {

            setTimeout(
                function () {

                    alertBox.style.display =
                        "none";

                },
                4000
            );
        }
    }
);