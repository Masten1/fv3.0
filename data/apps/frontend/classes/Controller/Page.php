<?php
/**
 * Created by PhpStorm.
 * User: Andrey
 * Date: 20.05.2015
 * Time: 14:23
 */
class Controller_Page extends fvController
{
    function indexAction()
    {
        $this->view()->page = $page = StaticPage::find(['techUrl' => ltrim(fvSite::app()->getInnerUri(), '/')]);

        if (!$page instanceof StaticPage) {
            throw new Error_PageNotFound('Page '.fvSite::app()->getInnerUri().' not found');
        }
    }
}