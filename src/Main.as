package 
{
	import com.dayvson.subtitle.SubtitleEvent;
	import com.dayvson.subtitle.formats.srt.SRTSubItem;
	import com.dayvson.subtitle.formats.srt.SRTSubTitle;
	import com.dayvson.subtitle.formats.srt.SRTTimeFormat;
	import com.dayvson.subtitle.formats.sub.SUBSubItem;
	import com.dayvson.subtitle.formats.sub.SUBSubTItle;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main()
		{			
			/*
			var subtitle:SUBSubTItle = new SUBSubTItle();
			subtitle.load("fixtures/fringe.sub");
			subtitle.addEventListener(SubtitleEvent.LOADED_SUBTITLE, function(e:SubtitleEvent):void{
				trace("loaded");
				trace(subtitle.lines.length);
				var subitem:SUBSubItem = subtitle.getByTime(61895);
				trace(subtitle.lines[2].text)
				trace(subitem.duration, subitem.text, subitem.startTime, subitem.endTime);
				
			}) 
			*/
			var subtitle:SRTSubTitle = new SRTSubTitle();
			subtitle.load("fixtures/bigbang.srt");
			subtitle.addEventListener(SubtitleEvent.LOADED_SUBTITLE, function(e:SubtitleEvent):void{
				trace("loaded");
				trace(subtitle.lines.length);
				var subitem:SRTSubItem = subtitle.lines[subtitle.lines.length-1];
				trace(subitem.duration, subitem.text, subitem.startTime, subitem.endTime, subitem.index);
				
			});
		}
	}
}