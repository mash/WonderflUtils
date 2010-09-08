// written by @maaash
// MIT License, see http://www.opensource.org/licenses/mit-license.php
package net.wonderfl.utils {
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;

    public class FontLoader extends EventDispatcher {
        public var loader :Loader;
        public static const availableFonts :Array = ["Aqua","Azuki","Cinecaption","Mona","Sazanami","YSHandy","VLGothic","IPAGP","IPAM","UmeUgo","UmePms","Bebas"];;
        private var base :String;
        public function FontLoader( _base: String = "http://assets.wonderfl.net/" ) {
            base   = _base;
            loader = new Loader;
        }
        public function load( font :String ) :void {
            if ( availableFonts.indexOf( font ) == -1 ) {
                throw( font +" not available, available fonts are: " + availableFonts.join(', ') );
            }

            loader.load(
                    new URLRequest( base + "static/fonts/"+font+".swf"),
                    new LoaderContext(
                                      true,
                                      ApplicationDomain.currentDomain, 
                                      SecurityDomain.currentDomain
                                      )
                    );
            loader.contentLoaderInfo.addEventListener( HTTPStatusEvent.HTTP_STATUS, dispatchEvent );
            loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, dispatchEvent );
            loader.contentLoaderInfo.addEventListener( Event.COMPLETE, function(e :Event) :void {
                var fontClass :Class = ApplicationDomain.currentDomain.getDefinition( "net.wonderfl.fonts." + font + "_font" ) as Class;
                Font.registerFont( fontClass );
                dispatchEvent( new Event( Event.COMPLETE ) );
            });
        }
    }
}
