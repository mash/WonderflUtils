package {
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.text.TextField;
    import flash.display.Sprite;
	import net.wonderfl.data.*;
	import net.wonderfl.utils.WonderflAPI;
	/**
	 * @author Taro KOBAYASHI
	 */
    public class WonderflAPITest extends Sprite {
        public function WonderflAPITest() {
            tf = new TextField;
            tf.wordWrap = true;
            tf.width = tf.height = 465;
            addChild(tf);
			
            var params:Object = {// loaderInfo.parameters
				"appId":"hjAy",
				"key":"ABQIAAAAXpWFDG8Wm9YzscY4IEB27xSO5wqdqdHVqPB8sVJhBj86bhrVXRSBgqnsO9rxcctD5ppITaLzKCDqHA",
				"open_api_key":"a76b80051993a7c6322bf8b4bbc457b44c3d4f5c",
				"viewer.displayName":"9re",
				"viewer.iconURL":"http://wonderfl.net/images/icon/e/e7/e792/e792bb80614beec2e183bd7d0a43e72da8c4317em",
				"domain":"wonderfl.net",
				"code_uid":"hjAy"
			};
            
            var api:WonderflAPI = new WonderflAPI(params);
            
            testSuit(
                new ApiTest(api.apiCode(), APICodeData),
				new ApiTest(api.apiForks(), APIForksData),
				new ApiTest(api.apiUser(), APIUserData),
				new ApiTest(api.apiUserCodes(), APIUserCodesData),
                new Test(
                    testComplete
                )
            );
        }
        
        
        private function testSuit(...tests:Array):void {
            for (var i:int = 0; i < tests.length - 1; ++i) 
                tests[i].next = tests[i + 1];
                
            tests[0].exec();
        }
        
        private function testComplete():void
        {
            trace('------------------------------');
            trace('all tests passed. ok');
        }
        
    }
}
import flash.text.TextField;

var tf:TextField;

function trace(...o):void {
	tf.appendText(o + "\n");
	tf.scrollV = tf.maxScrollV;
}

function assertAHasB(a:Object, b:Object):void {
	var value:*;
	for (var key:String in b) {
		value = a[key];
		if (typeof value == 'object') {
			assertAHasB(value, b[key]);
		} else {
			if (value != b[key]) throw new Error('doesnot match ' + key);
			trace(key + ' matched');
		}
	}
}

import com.adobe.serialization.json.JSON;
import flash.events.Event;
import flash.net.*;

class Test {
    protected var _exec:Function;
    public function Test($exec:Function):void {
        _exec = $exec;
    }
    public function exec():void {
        _exec();
    }
    public var next:Test;
}

class ApiTest extends Test {
    public function ApiTest(url:String, resultClass:Class) {
        var ldr:URLLoader = new URLLoader;
        ldr.addEventListener(Event.COMPLETE, function _complete(e:*):void {
            ldr.removeEventListener(Event.COMPLETE, _complete);
            var rawData:Object = JSON.decode(ldr.data);
            assertAHasB(new resultClass(rawData), rawData);
            trace(resultClass + ' test ok');
            trace();
            
            if (next != null) next.exec();
        });
        super(function ():void {
            trace('------------------------------');
            trace('loading data from ... ' + url);
            ldr.load(new URLRequest(url));
        });
    }
}