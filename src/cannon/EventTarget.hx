package cannon;

@:native("CANNON.EventTarget")
extern class EventTarget {
	function new() : Void;
	function addEventListener( type : String, listener : Dynamic ) : Void;
	function hasEventListener( type : String, listener : Dynamic ) : Bool;
	function removeEventListener( type : String, listener : Dynamic ) : Void;
	function dispatchEvent( event : Dynamic ) : Void;
}
