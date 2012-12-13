package  
{
	/**
	 * ...
	 * @author Patrick Junior Molinari De Bastiani
	 */
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	
	public class Level2 extends FlxGroup
	{
		[Embed(source="../assets/Map/Background.csv", mimeType="application/octet-stream")] public var skyCSV:Class;
		[Embed(source="../assets/Map/Map.csv", mimeType="application/octet-stream")] public var mapCSV:Class;
		[Embed(source="../assets/Map/Folhas.csv", mimeType="application/octet-stream")] public var folhasCSV:Class;
		[Embed(source="../assets/Map/Macas.csv", mimeType="application/octet-stream")] public var macasCSV:Class;
		
		[Embed(source="../assets/Map/background.png")] public var skyTilesPNG:Class;
		[Embed(source="../assets/Map/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source="../assets/Map/folha.png")] public var folhaPNG:Class;
		[Embed(source="../assets/Map/maca.png")] public var macaPNG:Class;
	
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		public var folhas:FlxGroup;
		public var macas:FlxGroup;
		
		public var width:int;
		public var height:int;
		public var totalFolhas:int;
		public var totalMacas:int;
		
		public function Level2()
		{
			super();
			
			sky = new FlxTilemap();
			sky.loadMap(new skyCSV, skyTilesPNG, 200, 60);
			sky.setTileProperties(1, FlxObject.NONE, null, null, 20);
			sky.scrollFactor.x = 0.95;
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapTilesPNG, 60, 60, 0, 0, 1, 31);
			
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(4, FlxObject.ANY, null, null, 0);
			map.setTileProperties(6, FlxObject.NONE, hitWater, null, 1);//agua
			
			Registry.map = map;
			Registry.levelExit = new FlxPoint(49 * 60, 2 * 60);
			
			width = map.width;
			height = map.height;
			totalFolhas = 0;
			totalMacas = 0;
			
			FlxG.log(width);
			FlxG.log(height);
			
			add(sky);
			add(map);
			
			parseFolhas();
		}
		public function openExit():void
		{
			map.setTile(48, 2, 1, true);
			map.setTile(49, 2, 1, true);
		}
		public function initMacas():void
		{
			parseMacas();
		}
		private function parseMacas():void
		{
			var macaMap:FlxTilemap = new FlxTilemap();
			
			macaMap.loadMap(new macasCSV, macaPNG, 60, 60);
			
			macas = new FlxGroup();
			
			for (var ty:int = 0; ty < macaMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < macaMap.widthInTiles; tx++)
				{
					if (macaMap.getTile(tx, ty) == 1)
					{
						macas.add(new Maca(tx, ty));
						totalMacas++;
					}
				}
			}
		}
		private function parseFolhas():void
		{
			var folhaMap:FlxTilemap = new FlxTilemap();
			
			folhaMap.loadMap(new folhasCSV, folhaPNG, 60, 60);
			
			folhas = new FlxGroup();
			
			for (var ty:int = 0; ty < folhaMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < folhaMap.widthInTiles; tx++)
				{
					if (folhaMap.getTile(tx, ty) == 1)
					{
						folhas.add(new Folha(tx, ty));
						totalFolhas++;
					}
				}
			}
		}
		private function hitWater(tile :FlxTile, object :FlxObject):void
		{
			if (object is Player) {
				(object as Player).restart();
			}
		}
	}
}