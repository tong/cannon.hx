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
	function addEventListener<T>( type : String, listener : T->Void ) : EventTarget;

	/**
		Check if an event listener is added
	*/
	function hasEventListener( type : String, listener : Void->Void ) : Bool;

	/**
		Remove an event listener
	*/
	function removeEventListener( type : String, listener : Void->Void ) : EventTarget;

	/**
		Emit an event.
	*/
	function dispatchEvent( event : Dynamic ) : EventTarget;

}
