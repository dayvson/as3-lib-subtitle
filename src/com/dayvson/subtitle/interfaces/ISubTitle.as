package com.dayvson.subtitle.interfaces
{
	import com.dayvson.subtitle.base.SubTitleItem;

	public interface ISubTitle
	{
		function isValidRow(value:String):Boolean;
		function load(path:String):void;
		function getByTime(time:Number):SubTitleItem;
		function parse(data:String):void;
		function parseSubtitleRowAndAddItem(item:String):Boolean;
		function get length():Number;
	}
}