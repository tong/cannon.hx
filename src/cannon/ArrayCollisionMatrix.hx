package cannon;

@:native("CANNON.ArrayCollisionMatrix")
extern class ArrayCollisionMatrix {
	var matrix : Array<Dynamic>;
	function new() : Void;
	function get( i : Int, j : Int ) : Void;
	function set( i : Int, j : Int, value : Float ) : Void;
	function reset() : Void;
	function setNumObjects( n : Int ) : Void;
}
