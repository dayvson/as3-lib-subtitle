package 
{
	import com.dayvson.subtitle.base.SubTitleItem;
	import com.dayvson.subtitle.display.SubtitleViewer;
	import com.dayvson.subtitle.events.SubtitleEvent;
	import com.dayvson.subtitle.formats.SRTResource;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	[SWF(backgroundColor=0x000000)]
	public class Main extends Sprite
	{
		public function Main()
		{			

			var viewer:SubtitleViewer = new SubtitleViewer();
			viewer.x = 0;
			viewer.y = 0;
			addChild(viewer);
			var i:Number = 1;
			stage.addEventListener(MouseEvent.CLICK, function(e:*):void{
				trace("click");
				if(i == 1)viewer.stop(), i = 2;
				else if(i == 2)viewer.resume(), i = 1;
			});
			
			var subtitle:SRTResource = new SRTResource();
			subtitle.addEventListener(SubtitleEvent.LOADED_SUBTITLE, function(e:SubtitleEvent):void{
				trace("loaded subtitle");
				viewer.setSubTitle(	subtitle );
				//trace(subtitle.lines[0].startTime,subtitle.lines[0].endTime, getTimer()); 
				viewer.start();
			});
			subtitle.load("fixtures/bigbang.srt");

			/*
			var subtitle:SRTResource = new SRTResource();
			subtitle.load("fixtures/bigbang.srt");
			subtitle.addEventListener(SubtitleEvent.LOADED_SUBTITLE, function(e:SubtitleEvent):void{
				trace("loaded");
				trace(subtitle.lines.length);
				var subitem:SubTitleItem = subtitle.lines[subtitle.lines.length-1];
				trace(subitem.duration, subitem.text, subitem.startTime, subitem.endTime, subitem.index);
				
			});*/
		}
	}
}