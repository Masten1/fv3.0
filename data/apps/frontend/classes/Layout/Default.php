<?php

class Layout_Default extends fvLayout
{
    function __construct()
    {
        $this->view()->lang = Language::getManager()->getCurrentLanguage()->code;

        $this->addCSS([
            "/theme/css/styles.css",
            "/theme/bootstrap-3.3.5/css/bootstrap.css",
            "/theme/fonts/font-awesome/font-awesome.css",
            "/theme/scripts/magnific-popup/dist/magnific-popup.css"
        ]);

        $this->addJS([
            "/theme/scripts/jquery.min.js",
        ]);

        $this->view()->assignParams([
        ]);
    }

}