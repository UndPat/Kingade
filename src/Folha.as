package  
{
	import org.flixel.FlxSprite;

	public class Folha extends FlxSprite
	{
		[Embed(source = '../assets/Map/folha.png')] private var folhaPNG:Class;
		
		public function Folha(X:int, Y:int)
		{
			super(X * 60, Y * 60, folhaPNG);
			
			solid = true;
		}
		
	}

}