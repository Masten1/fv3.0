<?php

class Controller_Home extends fvController
{

    /**
     * @route /
     */
    function indexAction()
    {
        $page = StaticPage::find(['techUrl' => 'main']);
        if ($page instanceof StaticPage) {
            $this->getLayout()->fillMeta($page);
        }

        $this->view()->assignParams([

        ]);

        $this->getLayout()->addCSS([
            "/theme/scripts/slick-1.5.7/slick-1.5.7/slick/slick.css"
        ]);

        $this->getLayout()->addJS([
            "/theme/scripts/slick-1.5.7/slick-1.5.7/slick/slick.js",
            "/theme/scripts/slick-initialization.js",
            '/theme/scripts/backgroundVideo.min.js'
        ]);
    }

}