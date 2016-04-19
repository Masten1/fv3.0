<?php
/**
 * Created by PhpStorm.
 * User: twida_000
 * Date: 12/17/2014
 * Time: 12:31 PM
 */

class MiddleWare_StaticRouter extends fvMiddleWare
{
    public function handle( fvRequest $request, fvResponse $response, fvMiddleWaresChain $chain ){
        $router = fvSite::app()->getRouter();
        try {
            $route = $router->getCurrentRoute();
        } catch (Error_PageNotFound $notFound) {
            $route = fvRoute::make([
                'controller' => 'Controller_Page',
                'action' => 'index'
            ]);
        }

        $controllerClass = $route->getController();

        if( !class_exists($controllerClass) ){
            throw new Exception( "Controller '$controllerClass' not found!" );
        }

        /** @var fvController $controller */
        $controller = new $controllerClass;
        if( ! $controller->getLayout() ){
            $controller->setLayout( fvSite::app()->getDefaultLayout() );
        }

        $response->setResponseBody( $controller->handle( $route->getAction(), $router->getUriParams() ) );

        $chain->next();
    }
}