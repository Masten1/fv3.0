<?php
/**
 * User: Eternal1
 * Date: 5/1/2015
 * Time: 7:27 PM
 */

trait Trait_Validate
{

    function getErrors()
    {
        $result = [];
        foreach( $this->getFields() as $key => $field ) {
            if (!$field->isValid()) {
                $result[] = $key;
            }
        }
        return $result;
    }

}