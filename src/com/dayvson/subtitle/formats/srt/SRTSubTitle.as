package com.dayvson.subtitle.formats.srt
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flashx.textLayout.formats.FormatValue;
	import com.dayvson.subtitle.SubtitleEvent;

	public class SRTSubTitle extends EventDispatcher
	{
		public var lines:Array;
		public var kind:String = "SRT";
		private const BLOCK_PATTERN:RegExp = /\n\r?\n/;
		private var urlLoader:URLLoader;
		public function SRTSubTitle()
		{
			lines = [];
		}
		public function load(path:String, kind:String = "SRT"):void{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadedSubtitle);
			urlLoader.load(new URLRequest(path));
		}
		
		public function parse(data:String, kind:String = "SRT"):void{
			var blocks:Array = data.split(BLOCK_PATTERN);
			for each(var item:String in blocks){
				if(trim(item) == ""){
					continue;
				}
				
				var subitem:SRTSubItem = new SRTSubItem(item);
				this.lines.push(subitem);
			}
			this.kind = kind.toUpperCase();
		}
		private function loadedSubtitle(e:Event):void{
			this.parse(urlLoader.data);
			dispatchEvent(new SubtitleEvent(SubtitleEvent.LOADED_SUBTITLE,kind));
		}
		private function trim(value:String):String
		{	
			return value.replace(/^\s+|\s+$/gs, '');
		}
	}
}