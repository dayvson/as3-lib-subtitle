package com.dayvson.subtitle.base
{
	import com.dayvson.subtitle.events.SubtitleEvent;
	import com.dayvson.subtitle.interfaces.ISubTitle;
	import com.dayvson.subtitle.interfaces.ISubTitleItem;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.dayvson.subtitle.events.SubtitleEvent;
	
	public class SubTitleBase extends EventDispatcher implements ISubTitle
	{
		public var lines:Array;
		protected static const BLOCK_PATTERN:RegExp = /\n\r?\n/;
		
		private var urlLoader:URLLoader;
		
		public function SubTitleBase(){
			lines = [];
		}
		
		public function load(path:String):void{
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadedSubtitle);
			urlLoader.load(new URLRequest(path));
		}
		
		public function getByTime(time:Number):SubTitleItem{
			for each(var item:SubTitleItem in lines){
				if(time >= item.startTime && time <= item.endTime){
					return item;
				}
			}
			return null;
		}
		
		public function parse(data:String):void{
			var blocks:Array = data.split(BLOCK_PATTERN);
			for each(var item:String in blocks){
				if(isValidRow(item)){
					continue;
				}
				parseSubtitleRowAndAddItem(item);
			}
		}
		public function parseSubtitleRowAndAddItem(item:String):Boolean{
			//To override
			return true;
		}
		public function get length():Number{
			return this.lines.length;
		}
		
		public function isValidRow(value:String):Boolean{
			return trim(value) == "";
		}
		
		private function trim(value:String):String{	
			return value.replace(/^\s+|\s+$/gs, '');
		}
		
		private function loadedSubtitle(e:Event):void{
			this.parse(urlLoader.data);
			dispatchEvent(new SubtitleEvent(SubtitleEvent.LOADED_SUBTITLE));
		}
	}
}