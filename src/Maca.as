package  
{
	import org.flixel.FlxSprite;

	public class Maca extends FlxSprite
	{
		[Embed(source = '../assets/Map/maca.png')] private var macaPNG:Class;
		
		public function Maca(X:int, Y:int)
		{
			super(X * 60, Y * 60, macaPNG);
			
			solid = true;
		}
		
	}

}