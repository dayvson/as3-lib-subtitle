package com.dayvson.subtitle.formats.srt
{
	
	import com.dayvson.subtitle.SubtitleEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flashx.textLayout.formats.FormatValue;

	public class SRTSubTitle extends EventDispatcher
	{
		public var lines:Array;
		private const BLOCK_PATTERN:RegExp = /\n\r?\n/;
		private var urlLoader:URLLoader;
		public function SRTSubTitle()
		{
			lines = [];
		}
		public function load(path:String):void{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadedSubtitle);
			urlLoader.load(new URLRequest(path));
		}
		
		public function getByTime(time:Number):SRTSubItem{
			for each(var item:SRTSubItem in lines){
				if(time >= item.startTime && time <= item.endTime){
					return item;
				}
			}
			return new SRTSubItem();
		}
		
		public function parse(data:String):void{
			var blocks:Array = data.split(BLOCK_PATTERN);
			for each(var item:String in blocks){
				if(trim(item) == ""){
					continue;
				}
				var subitem:SRTSubItem = new SRTSubItem(item);
				this.lines.push(subitem);
			}
		}
		public function get length():Number{
			return this.lines.length;
		}
		private function loadedSubtitle(e:Event):void{
			this.parse(urlLoader.data);
			dispatchEvent(new SubtitleEvent(SubtitleEvent.LOADED_SUBTITLE));
		}
		
		private function trim(value:String):String
		{	
			return value.replace(/^\s+|\s+$/gs, '');
		}
	}
}