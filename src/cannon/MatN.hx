package cannon;

@:native("CANNON.MatN")
extern class MatN {
	function new( cols : Int, rows : Int, ?elements : Array<Dynamic> ) : Void;
	function identity() : Void;
}
