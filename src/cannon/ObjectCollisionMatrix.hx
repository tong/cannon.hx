package cannon;

@:native("CANNON.ObjectCollisionMatrix")
extern class ObjectCollisionMatrix {
	function new() : Void;
	function get( i : Int, j : Int ) : Void;
	function set( i : Int, j : Int, value : Float ) : Void;
	function reset() : Void;
	function setNumObjects( n : Int ) : Void;

}
