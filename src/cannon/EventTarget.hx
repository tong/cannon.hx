package cannon;

/**
	Base class for objects that dispatches events.
*/
@:native("CANNON.EventTarget")
extern class EventTarget {

	function new() : Void;

	/**
		Add an event listener
	*/
	function addEventListener( type : String, listener : Dynamic->Void ) : EventTarget;

	/**
		Check if an event listener is added
	*/
	function hasEventListener( type : String, listener : Dynamic->Void ) : Bool;

	/**
		Remove an event listener
	*/
	function removeEventListener( type : String, listener : Dynamic->Void ) : EventTarget;

	/**
		Emit an event.
	*/
	function dispatchEvent( event : Dynamic ) : EventTarget;

}
