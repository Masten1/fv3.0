<?php

trait Trait_iWebAccess
{
    public function getHref()
    {
        if( !$this->url->get() ){
            $this->generateUrl();
            $this->save();
        }

        return $this->getUrl();
    }

    public function generateUrl()
    {
        $translit = new Translit;
        $translitUrl = $translit->transliterate( (string)$this );
        $url = $translit->transliterate( (string)$this );
        $count = 0;
        while( self::find( [ "url" => $url ] ) instanceof self ){
            $url = $translitUrl . "-" . ( ++$count );
        }
        $this->url = $url;
    }

    abstract function getUrl();
} 