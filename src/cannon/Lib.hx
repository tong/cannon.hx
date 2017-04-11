package cannon;

#if macro

import haxe.macro.Context;
import haxe.macro.Compiler;

using StringTools;

class Lib {

    static function build() {
		if( Context.defined( 'cannonjs_include' ) ) {
			var classPaths = Context.getClassPath();
			for( cp in classPaths ) {
				if( cp.endsWith( '/cannon.hx/src/' ) ) {
					cp = cp.substr( 0, cp.length - 5 );
					var ext = Context.defined( 'debug' ) ? 'js' : 'min.js';
					Compiler.includeFile( '$cp/res/script/cannon.$ext' );
					break;
				}
			}
		}
	}
}

#end
