package com.dayvson.subtitle.formats.srt
{
	import org.osmf.net.StreamingURLResource;

	public class SRTSubItem
	{
		/*
		1 ===> {index}
		00:00:15,431 {startTime} --> 00:00:16,898  {endTime}
		Certo, me expliquem... {text}
		*/
		public var index		:Number;
		public var startTime	:Number;
		public var endTime		:Number;
		public var text			:String;
		public var duration		:Number;
		
		private const ROW_PATTERN:RegExp = /\r?\n/;
		
		public function SRTSubItem(item:String)
		{
			var result:Array = item.split(ROW_PATTERN);
			var times:Array = (result[1] as String).match(SRTTimeFormat.TIME_PATTERN);
			this.index = result[0];
			this.startTime = SRTTimeFormat.resolve(times[0]);
			this.endTime = SRTTimeFormat.resolve(times[1]);
			this.text = result.slice(2, result.length).join("\n");
			this.duration = this.endTime - this.startTime;
		}
		public function toString():String
		{
			return "[" + this.startTime + " - " + this.endTime + "\n" + text + "]";
		}
	}
}