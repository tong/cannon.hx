
class Cannon {

	static function __init__() {
		#if !noEmbedJS
			#if debug
			haxe.macro.Compiler.includeFile("res/cannon.min.js");
			#else
			haxe.macro.Compiler.includeFile("res/cannon.js");
			#end
		#end
	}

}
