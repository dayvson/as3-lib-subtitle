package com.dayvson.subtitle.formats.sub
{
	import com.dayvson.subtitle.SubtitleEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class SUBSubTItle extends EventDispatcher
	{
 
		public var lines:Array;
		public var kind:String = "SRT";
		private var urlLoader:URLLoader;
		private const BLOCK_PATTERN:RegExp = /\r?\n/;
		public function SUBSubTItle()
		{
			lines = [];
		}
		public function load(path:String, kind:String = "SUB"):void{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadedSubtitle);
			urlLoader.load(new URLRequest(path));
		}
		public function getByTime(time:Number):SUBSubItem{
			for each(var item:SUBSubItem in lines){
				if(time >= item.startTime && time  <= item.endTime ){
					return item;
				}
			}
			return new SUBSubItem();
		}
		public function parse(data:String, kind:String = "SUB"):void{
			var blocks:Array = data.split(BLOCK_PATTERN);
			for each(var item:String in blocks){
				var subitem:SUBSubItem = new SUBSubItem(item);
				this.lines.push(subitem);
			}
			this.kind = kind.toUpperCase();
		}
		private function loadedSubtitle(e:Event):void{
			this.parse(urlLoader.data);
			dispatchEvent(new SubtitleEvent(SubtitleEvent.LOADED_SUBTITLE,kind));
		}
	}
}