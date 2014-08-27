package cannon;

@:native("CANNON.Pool")
extern class Pool {
	var objects : Array<Dynamic>;
	var type : Dynamic;
	function new() : Void;
	function release() : Void;
	function get() : Dynamic;
	function constructObject() : Void;
}
