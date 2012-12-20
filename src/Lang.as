package 
{
	import flash.display.LoaderInfo;
	import org.flixel.FlxG;

	/**
	 * @author Andrey Volodko
	 * @link http://flashgamedojo.com/wiki/index.php?title=Localization_(Flixel)_v2
	 */
	public class Lang
	{
		private static var lngArr :Object;

		// English strings - Also use if other keys are null
		public static var br :Object = {
			gameTitle			:"A ilha da macieira!", 
			menuPlay			:"Iniciar!",
			menuCredits			:"Créditos",
			menuBack			:"Voltar",
			creditsList			:"A ilha da macieira!\n\nProjeto 'Educação Ambiental e produção de material multimídia com caráter pedagógico e educativo'\n\nEdital 09/PROEC/UFFS/2011\nUniversidade Federal da Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nCoordenador\nProf. Fernando Bevilacqua\n\n\nEquipe UFFS\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Rafael Piccin Torchelsen\nProfa. Aurelia Lopes Gomes\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\nPatrick Bastiani (Ciência da Computação)\n\n\nEquipe Escola de Educação Básica Lourdes Tonin\nRosilei Hans (Diretora)\nMarinês Camatti (Professora do 5ª ano)\nDanieli Do Nascimento da Luz (2ª professora do 5º ano)\nPatrícia Vivian (Professora 7º 01 ano)\nHelena Maria Simon (Professora 7º 02 ano)\n\n\nDesenhos\nAlunos da 7º 01, E.E.B. Lourdes Tonin\n\n\nAgradecimento especial\nEquipe e alunos da escola Lourdes Tonin\nRich \"Photonstorm\" Davey\n\n\nFinanciamento\nPró-reitoria de Extensão, UFFS",
			youWin				:"Você venceu!"
		};

		// Brazilian portuguese strings
		public static var en :Object = {
			gameTitle			:"A ilha da macieira!", 
			menuPlay			:"Iniciar!",
			menuCredits			:"Créditos",
			menuBack			:"Voltar",
			creditsList			:"A ilha da macieira!\n\nProjeto 'Educação Ambiental e produção de material multimídia com caráter pedagógico e educativo'\n\nEdital 09/PROEC/UFFS/2011\nUniversidade Federal da Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nCoordenador\nProf. Fernando Bevilacqua\n\n\nEquipe UFFS\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Rafael Piccin Torchelsen\nProfa. Aurelia Lopes Gomes\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\nPatrick Bastiani (Ciência da Computação)\n\n\nEquipe Escola de Educação Básica Lourdes Tonin\nRosilei Hans (Diretora)\nMarinês Camatti (Professora do 5ª ano)\nDanieli Do Nascimento da Luz (2ª professora do 5º ano)\nPatrícia Vivian (Professora 7º 01 ano)\nHelena Maria Simon (Professora 7º 02 ano)\n\n\nDesenhos\nAlunos da 7º 01, E.E.B. Lourdes Tonin\n\n\nAgradecimento especial\nEquipe e alunos da escola Lourdes Tonin\nRich \"Photonstorm\" Davey\n\n\nFinanciamento\nPró-reitoria de Extensão, UFFS",
			youWin				:"Você venceu!"
		};
		/**
		 * 
		 */
		public function Lang() {
		}
		/**
		 * Lang initialization. You must call it before.
		 * Use: Lang.init();
		 */
		static public function init():void {
			lngArr = br;

			// check flashvars
			try {
				var params:Object = LoaderInfo(FlxG.stage.root.loaderInfo).parameters;

				if (params.lang != null) {
					setLang(params.lang);
					FlxG.log("Selected language: " + params.lang);
				}
			} catch (e :Error) {
				FlxG.log("Unable to select language.");
			}
		} 

		/**
		 * Set language
		 * Use: Lang.setLng(Lang.ru);
		 */
		static public function setLang(code:String):void {
				switch(code) {
					case "en":
						lngArr = en;
						break;

					case "br":
					case "pt-br":
					default:
						lngArr = br;
						break;
				}
		}
		/**
		 * Localization helper
		 * Use: Lang.get("name");
		 */
		static public function get(sname :String) :String {
			if (lngArr[sname] == null) {
				return br[sname];
			} else {
				return lngArr[sname];
			}
		}
	}
}