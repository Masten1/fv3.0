<?php
/**
 * Created by PhpStorm.
 * User: twida_000
 * Date: 12/15/2014
 * Time: 6:37 PM
 */

class MiddleWare_Languages extends fvMiddleWare
{
    private $redirect = true;

    function __construct( $params ){
        if( isset( $params["redirect"] ) ){
            $this->redirect = $params["redirect"];
        }
    }

    public function handle( fvRequest $request, fvResponse $response, fvMiddleWaresChain $chain ){
        $currentLanguage = $this->getLanguage( $request->getCurrentUrl() );


        if( ! $currentLanguage instanceof Language ){
            $currentLanguage = Language::getManager()->getDefaultLanguage();
        }

        Language::getManager()->setCurrentLanguage( $currentLanguage );

        fvSite::app()->setInnerPrefix( $currentLanguage->code->get() );

        $chain->next();
    }

    private function getLanguage( $uri ){
        $languages = Language::getManager()->getAll();

        foreach( $languages as $language ){
            if( preg_match( "/^\\/{$language->code}(\\/|$)/", $uri ) ){
                return $language;
            }
        }

        return null;
    }
}