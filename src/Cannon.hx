
class Cannon {

	public static inline var REV = 782;

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
